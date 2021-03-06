import 'dart:math';

import 'package:app/model/cotacao_dto.dart';
import 'package:app/model/cotacao_model.dart';
import 'package:app/model/point_model.dart';
import 'package:app/model/ponto_coleta_entrega.dart';
import 'package:app/service/firebase_realtime_database.dart';
import 'package:app/store/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_places_autocomplete/model/place.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'cotacao_store.g.dart';

class CotacaoStore = _CotacaoStore with _$CotacaoStore;

abstract class _CotacaoStore with Store {
  _CotacaoStore() {
    init();
  }

  @observable
  bool loading = false;

  @observable
  ObservableList<PontoColetaEntrega> pontosColetaEntrega =
      ObservableList<PontoColetaEntrega>();

  @observable
  ObservableSet<Marker> markers = ObservableSet<Marker>();

  @observable
  ObservableSet<Polyline> polylines = ObservableSet<Polyline>();

  @observable
  CotacaoModel? cotacao;

  @observable
  String? isValidToCotarErrorMessage;

  @observable
  CameraUpdate? cameraUpdate;

  @observable
  double? distanciaTotalRota;

  @action
  Future<void> init() async {
    pontosColetaEntrega = ObservableList<PontoColetaEntrega>();
    pontosColetaEntrega.add(PontoColetaEntrega(
        id: 'A',
        ativaModalEntrega: true,
        ehPrimeiroPonto: true,
        retornaParaOrigem: false));
    pontosColetaEntrega.add(PontoColetaEntrega(id: 'B'));
  }

  @action
  void addPoint(
      bool ativaModalEntrega, bool ehPrimeiroPonto, bool retornaParaOrigem) {
    var uuid = const Uuid();

    pontosColetaEntrega.add(PontoColetaEntrega(
        id: uuid.v4(),
        ativaModalEntrega: ativaModalEntrega,
        ehPrimeiroPonto: ehPrimeiroPonto,
        retornaParaOrigem: retornaParaOrigem));
  }

  @action
  void removeLastPoint() {
    if (pontosColetaEntrega.length > 2) {
      pontosColetaEntrega.removeLast();
      updateMarkers();
    }
  }

  @action
  Future<void> onSuggestionClick(Place placeDetails, String id) async {
    // limpa uma cotacao antiga
    FirebaseRealtimeDatabaseService service =
        GetIt.I.get<FirebaseRealtimeDatabaseService>();
    await service.clear();

    // filtra os pontos de coleta pelo id para atribuir os detalhes
    pontosColetaEntrega
        .firstWhere((pontoColetaEntrega) => pontoColetaEntrega.id == id)
        .place = placeDetails;

    // atualiza os pontos no mapa
    updateMarkers();

    //ajustar o retangulo da camera do mapa adicionando os pontos
    computeBounds();
  }

  @action
  Future<void> updateMarkers() async {
    //marcadores
    markers = ObservableSet<Marker>();
    polylines = ObservableSet<Polyline>();

    //paths
    List<LatLng> points = [];
    bool anyPoint = false;

    for (int x = 0; x < pontosColetaEntrega.length; x++) {
      if (pontosColetaEntrega[x].place != null) {
        LatLng position = LatLng(pontosColetaEntrega[x].place!.lat!,
            pontosColetaEntrega[x].place!.lng!);
        BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 1, size: Size(16, 16)),
            "assets/images/pin_icon.png");

        Marker marker = Marker(
            position: position,
            icon: icon,
            markerId: MarkerId(pontosColetaEntrega[x].id));
        //adciona o marcador
        markers.add(marker);
        // adiciona o ponto na polyline
        points.add(position);
        //verifica q existe ao menos 1 ponto
        anyPoint = true;
      }
    }

    if (anyPoint) {
      Polyline polyline = Polyline(
          polylineId: const PolylineId("id"),
          points: points,
          color: Colors.red);
      polylines.add(polyline);
    }
  }

  @action
  void computeBounds() {
    var firstLatLng =
        pontosColetaEntrega.firstWhere((ponto) => ponto.place != null).place;
    if (firstLatLng != null) {
      var s = firstLatLng.lat ?? 0,
          n = firstLatLng.lng ?? 0,
          w = firstLatLng.lng ?? 0,
          e = firstLatLng.lng ?? 0;
      for (int x = 0; x < pontosColetaEntrega.length; x++) {
        if (pontosColetaEntrega[x].place != null) {
          var latlng = pontosColetaEntrega[x].place;
          if (latlng != null) {
            s = min(s, latlng.lat ?? 0);
            n = max(n, latlng.lat ?? 0);
            w = min(w, latlng.lng ?? 0);
            e = max(e, latlng.lng ?? 0);
          }
        }
      }
      var latLngBounds =
          LatLngBounds(southwest: LatLng(s, w), northeast: LatLng(n, e));
      cameraUpdate = CameraUpdate.newLatLngBounds(latLngBounds, 32);
    }
  }

  @action
  void setCotacao(CotacaoModel? nCotacao) {
    cotacao = null;
    cotacao = nCotacao;
  }

  @action
  Future<void> cotar() async {
    try {
      loading = true;
      UserStore userStore = GetIt.I.get<UserStore>();
      List<PointModel> points = [];

      for (int x = 0; x < pontosColetaEntrega.length; x++) {
        if (!pontosColetaEntrega[x].isValidToCotar()) {
          isValidToCotarErrorMessage = "Ponto sem endere??o";
          break;
        } else {
          Place? place = pontosColetaEntrega[x].place;

          points.add(PointModel(place!.lat!, place.lng!, place.city, place.state));
          isValidToCotarErrorMessage = null;
        }
      }

      if (isValidToCotarErrorMessage == null) {
        if (userStore.userCredential != null) {
          FirebaseRealtimeDatabaseService service =
              GetIt.I.get<FirebaseRealtimeDatabaseService>();

          CotacaoModel model = CotacaoModel(userStore.userCredential!.uid,
              points, DateTime.now().millisecondsSinceEpoch, []);

          CotacaoDTO dto = CotacaoDTO();
          await service.create(dto.toFirebaseDate(model));
        }
      }

      distanciaTotalRota = computeTotalDistance(points);
    } catch (e) {
      print(e);
    } finally {
      loading = false;
    }
  }
}

@action
double computeTotalDistance(points) {
  double totalDistance = 0;
  for (var i = 0; i < points.length - 1; i++) {
    totalDistance += calculateDistance(
        points[i].lat, points[i].lng, points[i + 1].lat, points[i + 1].lng);
  }
  return totalDistance;
}

@action
double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

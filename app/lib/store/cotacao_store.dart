import 'package:app/model/cotacao_dto.dart';
import 'package:app/model/cotacao_model.dart';
import 'package:app/model/point_model.dart';
import 'package:app/model/ponto_coleta_entrega.dart';
import 'package:app/service/firebase_realtime_database.dart';
import 'package:app/store/user.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_places_autocomplete/model/place.dart';
import 'package:mobx/mobx.dart';

part 'cotacao_store.g.dart';

class CotacaoStore = _CotacaoStore with _$CotacaoStore;

abstract class _CotacaoStore with Store {
  @observable
  ObservableList<PontoColetaEntrega> pontosColetaEntrega =
      ObservableList<PontoColetaEntrega>();

  @observable
  ObservableSet<Marker> markers = ObservableSet<Marker>();

  @observable
  String? streetNumber;
  @observable
  String? street;
  @observable
  String? city;
  @observable
  String? state;
  @observable
  CotacaoModel? cotacao;
  @observable
  String? isValidToCotarErrorMessage;

  @action
  Future<void> init() async {
    pontosColetaEntrega = ObservableList<PontoColetaEntrega>();
    pontosColetaEntrega.add(PontoColetaEntrega(
        id: 'A',
        ativaModalEntrega: true,
        ehPrimeiroPonto: true,
        retornaParaOrigem: false));
    pontosColetaEntrega.add(PontoColetaEntrega(id: 'B'));
    FirebaseRealtimeDatabaseService service =
        GetIt.I.get<FirebaseRealtimeDatabaseService>();
    await service.clear();
  }

  @action
  void addPoint(String id, bool ativaModalEntrega, bool ehPrimeiroPonto,
      bool retornaParaOrigem) {
    pontosColetaEntrega.add(PontoColetaEntrega(
        id: id,
        ativaModalEntrega: ativaModalEntrega,
        ehPrimeiroPonto: ehPrimeiroPonto,
        retornaParaOrigem: retornaParaOrigem));
  }

  @action
  void removeLastPoint() {
    pontosColetaEntrega.removeLast();
    updateMarkers();
  }

  @action
  void onSuggestionClick(Place placeDetails, String id) {
    pontosColetaEntrega
        .firstWhere((pontoColetaEntrega) => pontoColetaEntrega.id == id)
        .place = placeDetails;

    streetNumber = placeDetails.streetNumber;
    street = placeDetails.street;
    city = placeDetails.city;
    state = placeDetails.state;

    updateMarkers();
  }

  @action
  Future<void> updateMarkers() async {
    markers = ObservableSet<Marker>();
    for (int x = 0; x < pontosColetaEntrega.length; x++) {
      if (pontosColetaEntrega[x].place != null) {
        LatLng position = LatLng(pontosColetaEntrega[x].place!.lat!,
            pontosColetaEntrega[x].place!.lng!);
        BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/images/pin_icon.png");
        Marker marker = Marker(
            position: position,
            icon: icon,
            markerId: MarkerId(pontosColetaEntrega[x].id));
        markers.add(marker);
      }
    }
  }

  @action
  void setCotacao(CotacaoModel? nCotacao) {
    cotacao = null;
    cotacao = nCotacao;
  }

  @action
  Future<void> cotar() async {
    UserStore userStore = GetIt.I.get<UserStore>();
    List<PointModel> points = [];

    for (int x = 0; x < pontosColetaEntrega.length; x++) {
      if (!pontosColetaEntrega[x].isValidToCotar()) {
        isValidToCotarErrorMessage = "Ponto sem endereço";
        break;
      } else {
        Place? place = pontosColetaEntrega[x].place;

        points.add(PointModel(place!.lat!, place.lng!, place.city));
        isValidToCotarErrorMessage = null;
      }
    }

    if (isValidToCotarErrorMessage == null) {
      if (userStore.userCredential != null) {
        FirebaseRealtimeDatabaseService service =
            GetIt.I.get<FirebaseRealtimeDatabaseService>();

        CotacaoModel model = CotacaoModel(userStore.userCredential!.uid, points,
            DateTime.now().millisecondsSinceEpoch, []);

        CotacaoDTO dto = CotacaoDTO();
        await service.create(dto.toFirebaseDate(model));
      }
    }
  }
}

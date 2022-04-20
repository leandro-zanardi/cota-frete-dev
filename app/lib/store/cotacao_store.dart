import 'package:app/model/cotacao_dto.dart';
import 'package:app/model/cotacao_model.dart';
import 'package:app/model/point_model.dart';
import 'package:app/model/ponto_coleta_entrega.dart';
import 'package:app/service/firebase_realtime_database.dart';
import 'package:app/store/user.dart';
import 'package:get_it/get_it.dart';
import 'package:maps_places_autocomplete/model/place.dart';
import 'package:mobx/mobx.dart';

part 'cotacao_store.g.dart';

class CotacaoStore = _CotacaoStore with _$CotacaoStore;

abstract class _CotacaoStore with Store {
  @observable
  ObservableList<PontoColetaEntrega> pontosColetaEntrega =
      ObservableList<PontoColetaEntrega>();

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
  }

  @action
  void onSuggestionClick(Place placeDetails, String id) {
    pontosColetaEntrega
        .firstWhere((pontoColetaEntrega) => pontoColetaEntrega.id == id).place = placeDetails;

    streetNumber = placeDetails.streetNumber;
    street = placeDetails.street;
    city = placeDetails.city;
    state = placeDetails.state;
  }

  @action
  void setCotacao(CotacaoModel? cotacao) {
    cotacao = cotacao;
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

        CotacaoModel model = CotacaoModel(
            userStore.userCredential!.uid,
            points,
            DateTime.now().millisecondsSinceEpoch
            );

        CotacaoDTO dto = CotacaoDTO();
        await service.create(dto.toFirebaseDate(model));
      }
    }
  }
}

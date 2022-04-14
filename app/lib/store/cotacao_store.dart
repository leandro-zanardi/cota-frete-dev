import 'package:app/model/cotacao_model.dart';
import 'package:app/model/ponto_coleta_entrega.dart';
import 'package:app/service/firebase_realtime_database.dart';
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

  @action
  void init() {
    pontosColetaEntrega = ObservableList<PontoColetaEntrega>();
    pontosColetaEntrega.add(PontoColetaEntrega(
        id: 'A',
        ativaModalEntrega: true,
        ehPrimeiroPonto: true,
        retornaParaOrigem: false));
    pontosColetaEntrega.add(PontoColetaEntrega(id: 'B'));
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
    streetNumber = placeDetails.streetNumber;
    street = placeDetails.street;
    city = placeDetails.city;
    state = placeDetails.state;
  }

  @action
  void setCotacao(CotacaoModel? cotacao) {
    cotacao = cotacao;
  }
}

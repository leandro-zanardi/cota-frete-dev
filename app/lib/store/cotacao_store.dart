import 'package:maps_places_autocomplete/model/place.dart';
import 'package:mobx/mobx.dart';

part 'cotacao_store.g.dart';

class CotacaoStore = _CotacaoStore with _$CotacaoStore;

abstract class _CotacaoStore with Store {
  @observable
  String? streetNumber;
  @observable
  String? street;
  @observable
  String? city;
  @observable
  String? state;

  @action
  void onSuggestionClick(Place placeDetails) {
    streetNumber = placeDetails.streetNumber;
    street = placeDetails.street;
    city = placeDetails.city;
    state = placeDetails.state;
  }
}

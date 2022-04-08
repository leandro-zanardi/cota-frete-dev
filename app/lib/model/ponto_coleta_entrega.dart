import 'package:maps_places_autocomplete/model/place.dart';

class PontoColetaEntrega {
  String id;
  Place? place;
  bool ativaModalEntrega;
  bool ehPrimeiroPonto;
  bool retornaParaOrigem;

  PontoColetaEntrega(
      {required this.id,
      this.ativaModalEntrega = false,
      this.ehPrimeiroPonto = false,
      this.retornaParaOrigem = false});

  void setPlace ( Place place) {
    this.place = place;
  }

}

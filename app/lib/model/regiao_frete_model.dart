//TODO refatorar esse nome de classe
// para FornecedorDestinoModel

class RegiaoFreteModel {
  //propriedades
  String estado;
  bool capital;
  double precoMin;
  double precoKm;

  //variaveis de erro
  String? estadoInvalido;
  String? capitalInvalida;
  String? precoMinInvalido = "erro preço";
  String? precoKmInvalido;

  RegiaoFreteModel(
      {required this.estado,
      required this.capital,
      required this.precoKm,
      required this.precoMin});
}

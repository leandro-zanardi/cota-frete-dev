import 'package:app/model/regiao_frete_model.dart';

class FornecedorModel {
  String nome;
  String? logo;
  List<FornecedorOrigem> origens;

  FornecedorModel({required this.nome, this.logo, required this.origens});
}

class FornecedorOrigem {
  String estado;
  bool capital;
  List<RegiaoFreteModel> destinos;

  FornecedorOrigem(
      {required this.estado, required this.capital, required this.destinos});
}

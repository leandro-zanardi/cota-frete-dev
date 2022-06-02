import 'package:app/model/regiao_frete_model.dart';

class FornecedorModel {
  // propriedades
  String nome;
  String? logo;
  List<FornecedorOrigem> origens;

  //propriedade de erros de negocio
  String? origensInvalidas;
  String? novaOrigemInvalida;

  FornecedorModel({required this.nome, this.logo, required this.origens});

  // validadores

  bool origensSaoValidas() {
    //TODO validar se todas as origens estao validas
    // chamando o validar de cada uma delas
    // caso nao marcar como invalida na variavel
    // origensInvalidas
    origensInvalidas = null;
    return true;
  }

  bool novaOrigeEhValida(FornecedorOrigem novaOrigem) {
    //TODO validar se uma nova origem
    // nao possui capital e estado repetido
    // nas oritens deste fornedor
    // caso seja invalida
    // popular a variavel novaOrigemInvalida
    // caso contrario limpar
    return true;
  }
}

class FornecedorOrigem {
  //propriedade
  String estado;
  bool capital;
  List<RegiaoFreteModel> destinos;

  //propriedades de erro
  String? estadoInvalido;
  String? capitalInvalida;
  String? destinosInvalidos;
  String? novoDestinoInvalido;

  FornecedorOrigem(
      {required this.estado, required this.capital, required this.destinos});
}

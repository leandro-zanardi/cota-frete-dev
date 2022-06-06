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
  String? precoMinInvalido;
  String? precoKmInvalido;

  RegiaoFreteModel(
      {required this.estado,
      required this.capital,
      required this.precoKm,
      required this.precoMin});

  bool get ehValidoEstado {
    if (estado.length == 2) {
      estadoInvalido = null;
      return true;
    } else {
      estadoInvalido = "Estado invádido";
      return false;
    }
  }

  bool get ehValidoPrecoMin {
    if (precoMin > 0) {
      precoMinInvalido = null;
      return true;
    } else {
      precoMinInvalido = "Preço Min. Inválido";
      return false;
    }
  }

  bool get ehValidoPrecoKm {
    if (precoKm > 0) {
      precoKmInvalido = null;
      return true;
    } else {
      precoKmInvalido = "Preço Km Inválido";
      return false;
    }
  }

  bool ehValidoDestino(RegiaoFreteModel destino) {
    if (capital != destino.capital || estado != destino.estado) {
      capitalInvalida = null;
      estadoInvalido = null;
      return true;
    } else {
      estadoInvalido = "destino repetido";
      capitalInvalida = "destino repetido";
      return false;
    }
  }

  bool get ehValido {
    return ehValidoEstado && ehValidoPrecoMin && ehValidoPrecoKm;
  }
}

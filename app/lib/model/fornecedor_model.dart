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
    //validar se todas as origens estao validas
    // chamando o validar de cada uma delas
    // caso nao marcar como invalida na variavel
    // origensInvalidas
    for (int x = 0; x < origens.length; x++) {
      if (!origens[x].ehValido) {
        origensInvalidas = "Origens inválidas";
        return false;
      }
    }
    origensInvalidas = null;
    return true;
  }

  bool novaOrigeEhValida(FornecedorOrigem novaOrigem) {
    // validar se uma nova origem
    // nao possui capital e estado repetido
    // nas oritens deste fornedor
    // caso seja invalida
    // popular a variavel novaOrigemInvalida
    // caso contrario limpar
    for (int x = 0; x < origens.length; x++) {
      if (!origens[x].ehValidoOrigem(novaOrigem.estado, novaOrigem.capital)) {
        novaOrigemInvalida = "Origem inválida";
        return false;
      }
    }
    novaOrigemInvalida = null;
    return true;
  }

  bool get ehValido {
    return nome != '' && origensSaoValidas();
  }
}

class FornecedorOrigem {
  //propriedade
  String estado;
  bool capital;
  List<FornecedorDestino> destinos;

  //propriedades de erro
  String? estadoInvalido;
  String? capitalInvalida;
  String? destinosInvalidos;

  FornecedorOrigem(
      {required this.estado, required this.capital, required this.destinos});

  bool ehValidoDestino(FornecedorDestino destino) {
    for (int x = 0; x < destinos.length; x++) {
      if (!identical(destinos[x], destino) &&
          !destino.ehValidoDestino(destinos[x])) {
        return false;
      }
    }
    return true;
  }

  bool get saoValidosDestinos {
    for (int x = 0; x < destinos.length; x++) {
      if (!destinos[x].ehValido) {
        return false;
      }
    }
    return true;
  }

  bool get ehValidoEstado {
    if (estado != '') {
      estadoInvalido = null;
      return true;
    } else {
      estadoInvalido = "Estado invádido";
      return false;
    }
  }

  bool ehValidoOrigem(String estadoOutro, bool capitalOutro) {
    if (capital != capitalOutro || estado != estadoOutro) {
      capitalInvalida = null;
      estadoInvalido = null;
      return true;
    } else {
      estadoInvalido = "origem repetida";
      capitalInvalida = "origem repetida";
      return false;
    }
  }

  bool get ehValido {
    return ehValidoEstado && saoValidosDestinos;
  }
}

class FornecedorDestino {
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

  FornecedorDestino(
      {required this.estado,
      required this.capital,
      required this.precoKm,
      required this.precoMin});

  bool get ehValidoEstado {
    if (estado != '') {
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

  bool ehValidoDestino(FornecedorDestino destino) {
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
    return ehValidoEstado && ehValidoPrecoKm && ehValidoPrecoMin;
  }
}

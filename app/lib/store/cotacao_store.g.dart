// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CotacaoStore on _CotacaoStore, Store {
  final _$pontosColetaEntregaAtom =
      Atom(name: '_CotacaoStore.pontosColetaEntrega');

  @override
  ObservableList<PontoColetaEntrega> get pontosColetaEntrega {
    _$pontosColetaEntregaAtom.reportRead();
    return super.pontosColetaEntrega;
  }

  @override
  set pontosColetaEntrega(ObservableList<PontoColetaEntrega> value) {
    _$pontosColetaEntregaAtom.reportWrite(value, super.pontosColetaEntrega, () {
      super.pontosColetaEntrega = value;
    });
  }

  final _$streetNumberAtom = Atom(name: '_CotacaoStore.streetNumber');

  @override
  String? get streetNumber {
    _$streetNumberAtom.reportRead();
    return super.streetNumber;
  }

  @override
  set streetNumber(String? value) {
    _$streetNumberAtom.reportWrite(value, super.streetNumber, () {
      super.streetNumber = value;
    });
  }

  final _$streetAtom = Atom(name: '_CotacaoStore.street');

  @override
  String? get street {
    _$streetAtom.reportRead();
    return super.street;
  }

  @override
  set street(String? value) {
    _$streetAtom.reportWrite(value, super.street, () {
      super.street = value;
    });
  }

  final _$cityAtom = Atom(name: '_CotacaoStore.city');

  @override
  String? get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String? value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$stateAtom = Atom(name: '_CotacaoStore.state');

  @override
  String? get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String? value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$cotacaoAtom = Atom(name: '_CotacaoStore.cotacao');

  @override
  CotacaoModel? get cotacao {
    _$cotacaoAtom.reportRead();
    return super.cotacao;
  }

  @override
  set cotacao(CotacaoModel? value) {
    _$cotacaoAtom.reportWrite(value, super.cotacao, () {
      super.cotacao = value;
    });
  }

  final _$_CotacaoStoreActionController =
      ActionController(name: '_CotacaoStore');

  @override
  void init() {
    final _$actionInfo =
        _$_CotacaoStoreActionController.startAction(name: '_CotacaoStore.init');
    try {
      return super.init();
    } finally {
      _$_CotacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPoint(String id, bool ativaModalEntrega, bool ehPrimeiroPonto,
      bool retornaParaOrigem) {
    final _$actionInfo = _$_CotacaoStoreActionController.startAction(
        name: '_CotacaoStore.addPoint');
    try {
      return super
          .addPoint(id, ativaModalEntrega, ehPrimeiroPonto, retornaParaOrigem);
    } finally {
      _$_CotacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeLastPoint() {
    final _$actionInfo = _$_CotacaoStoreActionController.startAction(
        name: '_CotacaoStore.removeLastPoint');
    try {
      return super.removeLastPoint();
    } finally {
      _$_CotacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSuggestionClick(Place placeDetails, String id) {
    final _$actionInfo = _$_CotacaoStoreActionController.startAction(
        name: '_CotacaoStore.onSuggestionClick');
    try {
      return super.onSuggestionClick(placeDetails, id);
    } finally {
      _$_CotacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCotacao(CotacaoModel? cotacao) {
    final _$actionInfo = _$_CotacaoStoreActionController.startAction(
        name: '_CotacaoStore.setCotacao');
    try {
      return super.setCotacao(cotacao);
    } finally {
      _$_CotacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pontosColetaEntrega: ${pontosColetaEntrega},
streetNumber: ${streetNumber},
street: ${street},
city: ${city},
state: ${state},
cotacao: ${cotacao}
    ''';
  }
}

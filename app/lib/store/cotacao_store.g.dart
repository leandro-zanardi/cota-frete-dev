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

  final _$isValidToCotarErrorMessageAtom =
      Atom(name: '_CotacaoStore.isValidToCotarErrorMessage');

  @override
  String? get isValidToCotarErrorMessage {
    _$isValidToCotarErrorMessageAtom.reportRead();
    return super.isValidToCotarErrorMessage;
  }

  @override
  set isValidToCotarErrorMessage(String? value) {
    _$isValidToCotarErrorMessageAtom
        .reportWrite(value, super.isValidToCotarErrorMessage, () {
      super.isValidToCotarErrorMessage = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_CotacaoStore.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$cotarAsyncAction = AsyncAction('_CotacaoStore.cotar');

  @override
  Future<void> cotar() {
    return _$cotarAsyncAction.run(() => super.cotar());
  }

  final _$_CotacaoStoreActionController =
      ActionController(name: '_CotacaoStore');

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
  void setCotacao(CotacaoModel? nCotacao) {
    final _$actionInfo = _$_CotacaoStoreActionController.startAction(
        name: '_CotacaoStore.setCotacao');
    try {
      return super.setCotacao(nCotacao);
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
cotacao: ${cotacao},
isValidToCotarErrorMessage: ${isValidToCotarErrorMessage}
    ''';
  }
}

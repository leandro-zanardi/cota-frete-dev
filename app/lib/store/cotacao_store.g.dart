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

  final _$markersAtom = Atom(name: '_CotacaoStore.markers');

  @override
  ObservableSet<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(ObservableSet<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
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

  final _$cameraUpdateAtom = Atom(name: '_CotacaoStore.cameraUpdate');

  @override
  CameraUpdate? get cameraUpdate {
    _$cameraUpdateAtom.reportRead();
    return super.cameraUpdate;
  }

  @override
  set cameraUpdate(CameraUpdate? value) {
    _$cameraUpdateAtom.reportWrite(value, super.cameraUpdate, () {
      super.cameraUpdate = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_CotacaoStore.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$onSuggestionClickAsyncAction =
      AsyncAction('_CotacaoStore.onSuggestionClick');

  @override
  Future<void> onSuggestionClick(Place placeDetails, String id) {
    return _$onSuggestionClickAsyncAction
        .run(() => super.onSuggestionClick(placeDetails, id));
  }

  final _$updateMarkersAsyncAction = AsyncAction('_CotacaoStore.updateMarkers');

  @override
  Future<void> updateMarkers() {
    return _$updateMarkersAsyncAction.run(() => super.updateMarkers());
  }

  final _$cotarAsyncAction = AsyncAction('_CotacaoStore.cotar');

  @override
  Future<void> cotar() {
    return _$cotarAsyncAction.run(() => super.cotar());
  }

  final _$_CotacaoStoreActionController =
      ActionController(name: '_CotacaoStore');

  @override
  void addPoint(
      bool ativaModalEntrega, bool ehPrimeiroPonto, bool retornaParaOrigem) {
    final _$actionInfo = _$_CotacaoStoreActionController.startAction(
        name: '_CotacaoStore.addPoint');
    try {
      return super
          .addPoint(ativaModalEntrega, ehPrimeiroPonto, retornaParaOrigem);
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
  void computeBounds() {
    final _$actionInfo = _$_CotacaoStoreActionController.startAction(
        name: '_CotacaoStore.computeBounds');
    try {
      return super.computeBounds();
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
markers: ${markers},
cotacao: ${cotacao},
isValidToCotarErrorMessage: ${isValidToCotarErrorMessage},
cameraUpdate: ${cameraUpdate}
    ''';
  }
}

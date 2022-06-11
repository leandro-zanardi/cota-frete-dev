// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CotacaoStore on _CotacaoStore, Store {
  late final _$loadingAtom =
      Atom(name: '_CotacaoStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$pontosColetaEntregaAtom =
      Atom(name: '_CotacaoStore.pontosColetaEntrega', context: context);

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

  late final _$markersAtom =
      Atom(name: '_CotacaoStore.markers', context: context);

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

  late final _$polylinesAtom =
      Atom(name: '_CotacaoStore.polylines', context: context);

  @override
  ObservableSet<Polyline> get polylines {
    _$polylinesAtom.reportRead();
    return super.polylines;
  }

  @override
  set polylines(ObservableSet<Polyline> value) {
    _$polylinesAtom.reportWrite(value, super.polylines, () {
      super.polylines = value;
    });
  }

  late final _$cotacaoAtom =
      Atom(name: '_CotacaoStore.cotacao', context: context);

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

  late final _$isValidToCotarErrorMessageAtom =
      Atom(name: '_CotacaoStore.isValidToCotarErrorMessage', context: context);

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

  late final _$cameraUpdateAtom =
      Atom(name: '_CotacaoStore.cameraUpdate', context: context);

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

  late final _$distanciaTotalRotaAtom =
      Atom(name: '_CotacaoStore.distanciaTotalRota', context: context);

  @override
  double? get distanciaTotalRota {
    _$distanciaTotalRotaAtom.reportRead();
    return super.distanciaTotalRota;
  }

  @override
  set distanciaTotalRota(double? value) {
    _$distanciaTotalRotaAtom.reportWrite(value, super.distanciaTotalRota, () {
      super.distanciaTotalRota = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_CotacaoStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$onSuggestionClickAsyncAction =
      AsyncAction('_CotacaoStore.onSuggestionClick', context: context);

  @override
  Future<void> onSuggestionClick(Place placeDetails, String id) {
    return _$onSuggestionClickAsyncAction
        .run(() => super.onSuggestionClick(placeDetails, id));
  }

  late final _$updateMarkersAsyncAction =
      AsyncAction('_CotacaoStore.updateMarkers', context: context);

  @override
  Future<void> updateMarkers() {
    return _$updateMarkersAsyncAction.run(() => super.updateMarkers());
  }

  late final _$cotarAsyncAction =
      AsyncAction('_CotacaoStore.cotar', context: context);

  @override
  Future<void> cotar() {
    return _$cotarAsyncAction.run(() => super.cotar());
  }

  late final _$_CotacaoStoreActionController =
      ActionController(name: '_CotacaoStore', context: context);

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
loading: ${loading},
pontosColetaEntrega: ${pontosColetaEntrega},
markers: ${markers},
polylines: ${polylines},
cotacao: ${cotacao},
isValidToCotarErrorMessage: ${isValidToCotarErrorMessage},
cameraUpdate: ${cameraUpdate},
distanciaTotalRota: ${distanciaTotalRota}
    ''';
  }
}

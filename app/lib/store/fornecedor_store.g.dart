// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fornecedor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FornecedorStore on _FornecedorStore, Store {
  late final _$currentFornecedorAtom =
      Atom(name: '_FornecedorStore.currentFornecedor', context: context);

  @override
  FornecedorModel get currentFornecedor {
    _$currentFornecedorAtom.reportRead();
    return super.currentFornecedor;
  }

  @override
  set currentFornecedor(FornecedorModel value) {
    _$currentFornecedorAtom.reportWrite(value, super.currentFornecedor, () {
      super.currentFornecedor = value;
    });
  }

  late final _$fornecedoresAtom =
      Atom(name: '_FornecedorStore.fornecedores', context: context);

  @override
  ObservableList<FornecedorModel> get fornecedores {
    _$fornecedoresAtom.reportRead();
    return super.fornecedores;
  }

  @override
  set fornecedores(ObservableList<FornecedorModel> value) {
    _$fornecedoresAtom.reportWrite(value, super.fornecedores, () {
      super.fornecedores = value;
    });
  }

  late final _$capitaisAtom =
      Atom(name: '_FornecedorStore.capitais', context: context);

  @override
  ObservableList<CapitalModel> get capitais {
    _$capitaisAtom.reportRead();
    return super.capitais;
  }

  @override
  set capitais(ObservableList<CapitalModel> value) {
    _$capitaisAtom.reportWrite(value, super.capitais, () {
      super.capitais = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_FornecedorStore.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$getFornecedoresAsyncAction =
      AsyncAction('_FornecedorStore.getFornecedores', context: context);

  @override
  Future<void> getFornecedores() {
    return _$getFornecedoresAsyncAction.run(() => super.getFornecedores());
  }

  late final _$salvarFornecedorAsyncAction =
      AsyncAction('_FornecedorStore.salvarFornecedor', context: context);

  @override
  Future<void> salvarFornecedor() {
    return _$salvarFornecedorAsyncAction.run(() => super.salvarFornecedor());
  }

  late final _$_FornecedorStoreActionController =
      ActionController(name: '_FornecedorStore', context: context);

  @override
  void setCurrentFornecedor(String? idFornecedor) {
    final _$actionInfo = _$_FornecedorStoreActionController.startAction(
        name: '_FornecedorStore.setCurrentFornecedor');
    try {
      return super.setCurrentFornecedor(idFornecedor);
    } finally {
      _$_FornecedorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  FornecedorModel getFornecedorByIdOrNew(String? idFornecedor) {
    final _$actionInfo = _$_FornecedorStoreActionController.startAction(
        name: '_FornecedorStore.getFornecedorByIdOrNew');
    try {
      return super.getFornecedorByIdOrNew(idFornecedor);
    } finally {
      _$_FornecedorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editDestino(FornecedorOrigem origem, RegiaoFreteModel destino) {
    final _$actionInfo = _$_FornecedorStoreActionController.startAction(
        name: '_FornecedorStore.editDestino');
    try {
      return super.editDestino(origem, destino);
    } finally {
      _$_FornecedorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editOrigemCapital(FornecedorOrigem origem, bool value) {
    final _$actionInfo = _$_FornecedorStoreActionController.startAction(
        name: '_FornecedorStore.editOrigemCapital');
    try {
      return super.editOrigemCapital(origem, value);
    } finally {
      _$_FornecedorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editOrigemEstado(FornecedorOrigem origem, String value) {
    final _$actionInfo = _$_FornecedorStoreActionController.startAction(
        name: '_FornecedorStore.editOrigemEstado');
    try {
      return super.editOrigemEstado(origem, value);
    } finally {
      _$_FornecedorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addDestinoToOrigem(String estado, bool isCapital) {
    final _$actionInfo = _$_FornecedorStoreActionController.startAction(
        name: '_FornecedorStore.addDestinoToOrigem');
    try {
      return super.addDestinoToOrigem(estado, isCapital);
    } finally {
      _$_FornecedorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addOrigemToFornecedor() {
    final _$actionInfo = _$_FornecedorStoreActionController.startAction(
        name: '_FornecedorStore.addOrigemToFornecedor');
    try {
      return super.addOrigemToFornecedor();
    } finally {
      _$_FornecedorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentFornecedor: ${currentFornecedor},
fornecedores: ${fornecedores},
capitais: ${capitais}
    ''';
  }
}

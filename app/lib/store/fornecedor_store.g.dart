// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fornecedor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FornecedorStore on _FornecedorStore, Store {
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

  late final _$getFornecedoresAsyncAction =
      AsyncAction('_FornecedorStore.getFornecedores', context: context);

  @override
  Future<void> getFornecedores() {
    return _$getFornecedoresAsyncAction.run(() => super.getFornecedores());
  }

  late final _$salvarFornecedorAsyncAction =
      AsyncAction('_FornecedorStore.salvarFornecedor', context: context);

  @override
  Future<void> salvarFornecedor(FornecedorModel fornecedor) {
    return _$salvarFornecedorAsyncAction
        .run(() => super.salvarFornecedor(fornecedor));
  }

  late final _$_FornecedorStoreActionController =
      ActionController(name: '_FornecedorStore', context: context);

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
  void addDestinoToOrigem(
      FornecedorModel fornecedor, String estado, bool isCapital) {
    final _$actionInfo = _$_FornecedorStoreActionController.startAction(
        name: '_FornecedorStore.addDestinoToOrigem');
    try {
      return super.addDestinoToOrigem(fornecedor, estado, isCapital);
    } finally {
      _$_FornecedorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addOrigemToFornecedor(FornecedorModel fornecedor) {
    final _$actionInfo = _$_FornecedorStoreActionController.startAction(
        name: '_FornecedorStore.addOrigemToFornecedor');
    try {
      return super.addOrigemToFornecedor(fornecedor);
    } finally {
      _$_FornecedorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fornecedores: ${fornecedores}
    ''';
  }
}

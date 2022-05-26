// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fornecedor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FornecedorStore on _FornecedorStore, Store {
  final _$fornecedoresAtom = Atom(name: '_FornecedorStore.fornecedores');

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

  final _$getFornecedoresAsyncAction =
      AsyncAction('_FornecedorStore.getFornecedores');

  @override
  Future<void> getFornecedores() {
    return _$getFornecedoresAsyncAction.run(() => super.getFornecedores());
  }

  final _$salvarFornecedorAsyncAction =
      AsyncAction('_FornecedorStore.salvarFornecedor');

  @override
  Future<void> salvarFornecedor(String? idFornecedor) {
    return _$salvarFornecedorAsyncAction
        .run(() => super.salvarFornecedor(idFornecedor));
  }

  @override
  String toString() {
    return '''
fornecedores: ${fornecedores}
    ''';
  }
}

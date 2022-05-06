// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdminStore on _AdminStore, Store {
  final _$userUUIDTextFieldAtom = Atom(name: '_AdminStore.userUUIDTextField');

  @override
  String? get userUUIDTextField {
    _$userUUIDTextFieldAtom.reportRead();
    return super.userUUIDTextField;
  }

  @override
  set userUUIDTextField(String? value) {
    _$userUUIDTextFieldAtom.reportWrite(value, super.userUUIDTextField, () {
      super.userUUIDTextField = value;
    });
  }

  final _$loadingAtom = Atom(name: '_AdminStore.loading');

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

  final _$registerUserAdminAsyncAction =
      AsyncAction('_AdminStore.registerUserAdmin');

  @override
  Future<bool> registerUserAdmin() {
    return _$registerUserAdminAsyncAction.run(() => super.registerUserAdmin());
  }

  final _$_AdminStoreActionController = ActionController(name: '_AdminStore');

  @override
  void setUserUUITextField(String value) {
    final _$actionInfo = _$_AdminStoreActionController.startAction(
        name: '_AdminStore.setUserUUITextField');
    try {
      return super.setUserUUITextField(value);
    } finally {
      _$_AdminStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userUUIDTextField: ${userUUIDTextField},
loading: ${loading}
    ''';
  }
}

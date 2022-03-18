// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$emailRegisterAtom = Atom(name: '_UserStore.emailRegister');

  @override
  String? get emailRegister {
    _$emailRegisterAtom.reportRead();
    return super.emailRegister;
  }

  @override
  set emailRegister(String? value) {
    _$emailRegisterAtom.reportWrite(value, super.emailRegister, () {
      super.emailRegister = value;
    });
  }

  final _$emailRegisterErrorAtom = Atom(name: '_UserStore.emailRegisterError');

  @override
  String? get emailRegisterError {
    _$emailRegisterErrorAtom.reportRead();
    return super.emailRegisterError;
  }

  @override
  set emailRegisterError(String? value) {
    _$emailRegisterErrorAtom.reportWrite(value, super.emailRegisterError, () {
      super.emailRegisterError = value;
    });
  }

  final _$passwordRegisterAtom = Atom(name: '_UserStore.passwordRegister');

  @override
  String? get passwordRegister {
    _$passwordRegisterAtom.reportRead();
    return super.passwordRegister;
  }

  @override
  set passwordRegister(String? value) {
    _$passwordRegisterAtom.reportWrite(value, super.passwordRegister, () {
      super.passwordRegister = value;
    });
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void register() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.register');
    try {
      return super.register();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailRegister: ${emailRegister},
emailRegisterError: ${emailRegisterError},
passwordRegister: ${passwordRegister}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$userTokenAtom =
      Atom(name: '_UserStore.userToken', context: context);

  @override
  String? get userToken {
    _$userTokenAtom.reportRead();
    return super.userToken;
  }

  @override
  set userToken(String? value) {
    _$userTokenAtom.reportWrite(value, super.userToken, () {
      super.userToken = value;
    });
  }

  late final _$claimsAtom = Atom(name: '_UserStore.claims', context: context);

  @override
  ObservableMap<String, dynamic> get claims {
    _$claimsAtom.reportRead();
    return super.claims;
  }

  @override
  set claims(ObservableMap<String, dynamic> value) {
    _$claimsAtom.reportWrite(value, super.claims, () {
      super.claims = value;
    });
  }

  late final _$userCredentialAtom =
      Atom(name: '_UserStore.userCredential', context: context);

  @override
  User? get userCredential {
    _$userCredentialAtom.reportRead();
    return super.userCredential;
  }

  @override
  set userCredential(User? value) {
    _$userCredentialAtom.reportWrite(value, super.userCredential, () {
      super.userCredential = value;
    });
  }

  late final _$emailRegisterAtom =
      Atom(name: '_UserStore.emailRegister', context: context);

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

  late final _$emailRegisterErrorAtom =
      Atom(name: '_UserStore.emailRegisterError', context: context);

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

  late final _$passwordRegisterAtom =
      Atom(name: '_UserStore.passwordRegister', context: context);

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

  late final _$passwordRegisterErrorAtom =
      Atom(name: '_UserStore.passwordRegisterError', context: context);

  @override
  String? get passwordRegisterError {
    _$passwordRegisterErrorAtom.reportRead();
    return super.passwordRegisterError;
  }

  @override
  set passwordRegisterError(String? value) {
    _$passwordRegisterErrorAtom.reportWrite(value, super.passwordRegisterError,
        () {
      super.passwordRegisterError = value;
    });
  }

  late final _$emailLoginAtom =
      Atom(name: '_UserStore.emailLogin', context: context);

  @override
  String? get emailLogin {
    _$emailLoginAtom.reportRead();
    return super.emailLogin;
  }

  @override
  set emailLogin(String? value) {
    _$emailLoginAtom.reportWrite(value, super.emailLogin, () {
      super.emailLogin = value;
    });
  }

  late final _$emailLoginErrorAtom =
      Atom(name: '_UserStore.emailLoginError', context: context);

  @override
  String? get emailLoginError {
    _$emailLoginErrorAtom.reportRead();
    return super.emailLoginError;
  }

  @override
  set emailLoginError(String? value) {
    _$emailLoginErrorAtom.reportWrite(value, super.emailLoginError, () {
      super.emailLoginError = value;
    });
  }

  late final _$passwordLoginAtom =
      Atom(name: '_UserStore.passwordLogin', context: context);

  @override
  String? get passwordLogin {
    _$passwordLoginAtom.reportRead();
    return super.passwordLogin;
  }

  @override
  set passwordLogin(String? value) {
    _$passwordLoginAtom.reportWrite(value, super.passwordLogin, () {
      super.passwordLogin = value;
    });
  }

  late final _$passwordLoginErrorAtom =
      Atom(name: '_UserStore.passwordLoginError', context: context);

  @override
  String? get passwordLoginError {
    _$passwordLoginErrorAtom.reportRead();
    return super.passwordLoginError;
  }

  @override
  set passwordLoginError(String? value) {
    _$passwordLoginErrorAtom.reportWrite(value, super.passwordLoginError, () {
      super.passwordLoginError = value;
    });
  }

  late final _$isRegisterAtom =
      Atom(name: '_UserStore.isRegister', context: context);

  @override
  bool get isRegister {
    _$isRegisterAtom.reportRead();
    return super.isRegister;
  }

  @override
  set isRegister(bool value) {
    _$isRegisterAtom.reportWrite(value, super.isRegister, () {
      super.isRegister = value;
    });
  }

  late final _$permissionDeniedErrorAtom =
      Atom(name: '_UserStore.permissionDeniedError', context: context);

  @override
  String? get permissionDeniedError {
    _$permissionDeniedErrorAtom.reportRead();
    return super.permissionDeniedError;
  }

  @override
  set permissionDeniedError(String? value) {
    _$permissionDeniedErrorAtom.reportWrite(value, super.permissionDeniedError,
        () {
      super.permissionDeniedError = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('_UserStore.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$loginAsyncAction =
      AsyncAction('_UserStore.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$logoutAsyncAction =
      AsyncAction('_UserStore.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void toRegister() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.toRegister');
    try {
      return super.toRegister();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toLogin() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.toLogin');
    try {
      return super.toLogin();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateClaims(Map<String, dynamic> remoteClaims) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.updateClaims');
    try {
      return super.updateClaims(remoteClaims);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setToken(String? token) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setToken');
    try {
      return super.setToken(token);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(User? user) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPermissionDeniedError(String? error) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setPermissionDeniedError');
    try {
      return super.setPermissionDeniedError(error);
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
  void validatePassword(String password) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.validatePassword');
    try {
      return super.validatePassword(password);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmailLogin(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.validateEmailLogin');
    try {
      return super.validateEmailLogin(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePasswordLogin(String password) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.validatePasswordLogin');
    try {
      return super.validatePasswordLogin(password);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userToken: ${userToken},
claims: ${claims},
userCredential: ${userCredential},
emailRegister: ${emailRegister},
emailRegisterError: ${emailRegisterError},
passwordRegister: ${passwordRegister},
passwordRegisterError: ${passwordRegisterError},
emailLogin: ${emailLogin},
emailLoginError: ${emailLoginError},
passwordLogin: ${passwordLogin},
passwordLoginError: ${passwordLoginError},
isRegister: ${isRegister},
permissionDeniedError: ${permissionDeniedError}
    ''';
  }
}

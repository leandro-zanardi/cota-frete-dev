// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdminStore on _AdminStore, Store {
  late final _$loadingAtom =
      Atom(name: '_AdminStore.loading', context: context);

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

  late final _$userClientsAtom =
      Atom(name: '_AdminStore.userClients', context: context);

  @override
  ObservableList<UserClient> get userClients {
    _$userClientsAtom.reportRead();
    return super.userClients;
  }

  @override
  set userClients(ObservableList<UserClient> value) {
    _$userClientsAtom.reportWrite(value, super.userClients, () {
      super.userClients = value;
    });
  }

  late final _$registerUserAdminAsyncAction =
      AsyncAction('_AdminStore.registerUserAdmin', context: context);

  @override
  Future<void> registerUserAdmin(String uuid, bool isAdmin) {
    return _$registerUserAdminAsyncAction
        .run(() => super.registerUserAdmin(uuid, isAdmin));
  }

  late final _$_AdminStoreActionController =
      ActionController(name: '_AdminStore', context: context);

  @override
  void setUserClients(List<UserClient> clients) {
    final _$actionInfo = _$_AdminStoreActionController.startAction(
        name: '_AdminStore.setUserClients');
    try {
      return super.setUserClients(clients);
    } finally {
      _$_AdminStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
userClients: ${userClients}
    ''';
  }
}

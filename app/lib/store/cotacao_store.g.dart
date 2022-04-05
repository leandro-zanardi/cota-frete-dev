// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CotacaoStore on _CotacaoStore, Store {
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

  final _$_CotacaoStoreActionController =
      ActionController(name: '_CotacaoStore');

  @override
  void onSuggestionClick(Place placeDetails) {
    final _$actionInfo = _$_CotacaoStoreActionController.startAction(
        name: '_CotacaoStore.onSuggestionClick');
    try {
      return super.onSuggestionClick(placeDetails);
    } finally {
      _$_CotacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
streetNumber: ${streetNumber},
street: ${street},
city: ${city},
state: ${state}
    ''';
  }
}

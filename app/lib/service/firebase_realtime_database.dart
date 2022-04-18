import 'package:app/model/cotacao_dto.dart';
import 'package:app/store/cotacao_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';

import '../model/cotacao_model.dart';

class FirebaseRealtimeDatabaseService {
  bool _initializedStream = false;
  User? _user;
  DatabaseReference? _ref;

  set user(User? user) {
    _user = user;
    if (!_initializedStream && user != null) {
      init();
      _initializedStream = true;
    } else if (_initializedStream && user == null) {
      _ref = null;
      _initializedStream = false;
    }
  }

  Future<void> init() async {
    if (_user != null) {
      _ref = FirebaseDatabase.instance.ref("cotacao/${_user!.uid}");
      _ref!.onValue.listen((DatabaseEvent event) {
        final Map<String, dynamic> data =
            event.snapshot.value as Map<String, dynamic>;
        CotacaoModel? model = CotacaoDTO().fromJson(data);
        CotacaoStore store = GetIt.I.get<CotacaoStore>();
        store.setCotacao(model);
      }, onError: (Object error, StackTrace s) {
        print(error.toString());
        print(s);
      }, onDone: () {
        print("done");
      });
    }
  }

  Future<void> create(Map<String, dynamic>? json) async {
    if (_user != null) {
      _ref = FirebaseDatabase.instance.ref("cotacao/${_user!.uid}");
      await _ref!.set(json as Object);
    }
  }

  Future<void> clear() async {
    if (_user != null) {
      _ref = FirebaseDatabase.instance.ref("cotacao/${_user!.uid}");
      await _ref!.set(null);
    }
  }
}

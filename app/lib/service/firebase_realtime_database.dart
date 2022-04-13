import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseRealtimeDatabaseService {
  User? _user;

  set user(User? user) {
    _user = user;
  }

  User? get user => _user;

  Future<void> test() async {
    if (_user != null) {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("cotacao/${_user!.uid}");
      ref.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value;
        print(data.toString());
      }, onError: (Object error, StackTrace s) {
        print(error.toString());
        print(s);
      }, onDone: () {
        print("done");
      });
    }
  }
}

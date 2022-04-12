import 'package:firebase_database/firebase_database.dart';

class FirebaseRealtimeDatabaseService {
  
  
  
  Future<void> test() async{
    DatabaseReference ref = FirebaseDatabase.instance.ref("cotacao");
    ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print(data.toString());
    }, onError: (Object error, StackTrace s) {
      print(error.toString());
      print(s);
    }, onDone: () {});
  }
}

import 'package:app/store/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class FirebaseAuthService {
  FirebaseAuthService() {
    // auth listener
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      UserStore userStore = GetIt.I.get<UserStore>();

      if (user == null) {
        userStore.setUser(null);
        print('User is currently signed out!');
      } else {
        userStore.setUser(user);
        print('User is signed in!');
      }
    });
  }

  Future<UserCredential> register(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      rethrow;
      print(e);
    }
  }

  Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}

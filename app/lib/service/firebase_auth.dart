import 'package:app/service/firebase_realtime_database.dart';
import 'package:app/store/user.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class FirebaseAuthService {
  FirebaseAuthService() {
    // auth listener
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      UserStore userStore = GetIt.I.get<UserStore>();
      FirebaseRealtimeDatabaseService realDBTimeService =
          GetIt.I.get<FirebaseRealtimeDatabaseService>();

      //TODO
      // if (user != null) {
      //   final IdTokenResult idToken = await user!.getIdTokenResult();
      //   final claim = idToken.claims;
      // }

      userStore.setUser(user);
      realDBTimeService.user = user;

      if (navigationResolver != null && !navigationResolver!.isResolved) {
        if (!stackRouter!.isRoot && stackRouter!.canPopSelfOrChildren) {
          stackRouter?.pop();
        }
        navigationResolver?.next(user != null);
      }

      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  NavigationResolver? navigationResolver;
  StackRouter? stackRouter;
  void waitLoginResult(StackRouter router, NavigationResolver resolver) {
    navigationResolver = resolver;
    stackRouter = router;
  }

  bool get isLoggedIn {
    UserStore userStore = GetIt.I.get<UserStore>();
    return userStore.isLoggedin;
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

import 'package:app/infra/api/admin/list_all_users_api.dart';
import 'package:app/model/user_client.dart';
import 'package:app/model/user_list_data.dart';
import 'package:app/router/app_router.gr.dart';
import 'package:app/service/firebase_realtime_database.dart';
import 'package:app/store/admin_store.dart';
import 'package:app/store/user.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:get_it/get_it.dart';

class FirebaseAuthService {
  FirebaseAuthService() {
    // auth listener
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      UserStore userStore = GetIt.I.get<UserStore>();
      FirebaseRealtimeDatabaseService realDBTimeService =
          GetIt.I.get<FirebaseRealtimeDatabaseService>();

      Map<String, dynamic> claims = <String, dynamic>{};
      String? token;
      if (user != null) {
        final IdTokenResult idToken = await user.getIdTokenResult();
        final tokenClaims = idToken.claims;
        if (tokenClaims != null) {
          claims = tokenClaims;
        }
        token = idToken.token;
      }

      userStore.setUser(user);
      userStore.updateClaims(claims);
      userStore.setToken(token);

      realDBTimeService.user = user;

      if (navigationResolver != null && !navigationResolver!.isResolved) {
        if (!stackRouter!.isRoot && stackRouter!.canPopSelfOrChildren) {
          stackRouter?.pop();
        }
        navigationResolver?.next(user != null);
      } else if (navigationResolver == null && user != null) {
        GetIt.I.get<AppRouter>().pushNamed("/home");
      }

      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Future<void> updateUserClients() async {
    // TODO

    // buscar usarios
    List<UserClient> listAllUsers = [];
    //https://firebase.google.com/docs/auth/admin/manage-users?hl=pt-br

    ListAllUsersApi api = GetIt.I.get<ListAllUsersApi>();

    UserListData data = await api.listAllUsers(null);
    data.users.forEach((user) {
      listAllUsers.add(UserClient(
          uuid: user["uuid"] as String,
          email: user["email"] as String,
          admin: false));
    });

    // instanciar a admin store
    // setar uduarios na admin store
    AdminStore adminStore = GetIt.I.get<AdminStore>();
    adminStore.setUserClients(listAllUsers);
  }

  NavigationResolver? navigationResolver;
  StackRouter? stackRouter;
  void waitLoginResult(StackRouter router, NavigationResolver resolver) {
    navigationResolver = resolver;
    stackRouter = router;
  }

  String? get authToken {
    UserStore userStore = GetIt.I.get<UserStore>();
    return userStore.userToken;
  }

  bool get isLoggedIn {
    UserStore userStore = GetIt.I.get<UserStore>();
    return userStore.isLoggedin;
  }

  bool get isAdmin {
    UserStore userStore = GetIt.I.get<UserStore>();
    return userStore.isAdmin;
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

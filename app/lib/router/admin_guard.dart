import 'package:app/service/firebase_auth.dart';
import 'package:app/store/user.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';

class AdminGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    FirebaseAuthService authService = GetIt.I.get<FirebaseAuthService>();
    UserStore userStore = GetIt.I.get<UserStore>();

    print("ADMIN GUARD");

    if (authService.isAdmin) {
      userStore.setPermissionDeniedError(null);
      resolver.next(true);
    } else {
      userStore.setPermissionDeniedError("Permissão Negada");
      resolver.next(false);
      //TODO
    }
  }
}

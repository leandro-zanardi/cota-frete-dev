import 'package:app/service/firebase_auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    FirebaseAuthService authService = GetIt.I.get<FirebaseAuthService>();

    if (authService.isLoggedIn) {
      resolver.next(true);
    } else {
      router.pushNamed("/login");
      authService.waitLoginResult(router, resolver);
    }
  }
}

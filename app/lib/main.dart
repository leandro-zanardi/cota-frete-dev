import 'package:app/router/admin_guard.dart';
import 'package:app/router/app_router.gr.dart';
import 'package:app/router/auth_guard.dart';
import 'package:app/service/firebase_auth.dart';
import 'package:app/service/firebase_realtime_database.dart';
import 'package:app/store/cotacao_store.dart';
import 'package:app/store/user.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  GetIt getIt = GetIt.I;

  //service
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<FirebaseRealtimeDatabaseService>(
      FirebaseRealtimeDatabaseService());

  //store
  getIt.registerSingleton<CotacaoStore>(CotacaoStore());
  getIt.registerSingleton<UserStore>(UserStore());

  //route
  getIt.registerSingleton<AppRouter>(AppRouter(authGuard: AuthGuard(), adminGuard: AdminGuard()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = GetIt.I.get<AppRouter>();

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.cyan,
      ),
      routerDelegate: AutoRouterDelegate(router),
      routeInformationParser: router.defaultRouteParser()
    );
  }
}

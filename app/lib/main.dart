import 'package:app/service/firebase_auth.dart';
import 'package:app/service/firebase_realtime_database.dart';
import 'package:app/store/cotacao_store.dart';
import 'package:app/store/user.dart';
import 'package:app/views/Home.dart';
import 'package:app/views/Login.dart';
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
  getIt.registerSingleton<FirebaseRealtimeDatabaseService>(FirebaseRealtimeDatabaseService());

  //store
  getIt.registerSingleton<CotacaoStore>(CotacaoStore());
  getIt.registerSingleton<UserStore>(UserStore());

  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Login(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => const Home(),
      },
    );
  }
}

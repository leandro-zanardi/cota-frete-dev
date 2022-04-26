import 'package:app/service/firebase_auth.dart';
import 'package:app/service/firebase_realtime_database.dart';
import 'package:app/store/cotacao_store.dart';
import 'package:app/store/user.dart';
import 'package:app/views/Fornecedores.dart';
import 'package:app/views/Historico.dart';
import 'package:app/views/about.dart';
import 'package:app/views/Home.dart';
import 'package:app/views/Login.dart';
import 'package:app/views/cadastro_fornecedores.dart';
import 'package:app/views/configuracao_fornecedor.dart';
import 'package:app/views/configuracao_usuario.dart';
import 'package:app/views/map_view.dart';
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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    UserStore userStore = GetIt.I.get<UserStore>();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.cyan,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => userStore.isLoggedin ? const Home() : const Login(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/about': (context) => const About(),
        '/map': (context) => const MapView(),
        '/configuracao-usuario': (context) => const ConfiguracaoUsuario(),
        '/configuracao-fornecedor': (context) => const ConfiguracaoFornecedor(),
        '/fornecedores': (context) => const Fornecedores(),
        '/historico': (context) => const Historico(),
        '/cadastro-fornecedor': (context) => const CadastroFornecedor(),
      },
    );
  }
}

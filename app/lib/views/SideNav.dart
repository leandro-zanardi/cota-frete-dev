import 'package:app/router/app_router.gr.dart';
import 'package:app/store/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Sidenav extends StatelessWidget {
  const Sidenav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      Image.asset(
        'assets/images/bg.png',
        width: 150.0,
        height: 150.0,
      ),
      ListTile(
        title: const Text('Home'),
        leading: const Icon(Icons.home),
        onTap: () async {
          GetIt.I.get<AppRouter>().pop();
        },
      ),
      if (GetIt.I.get<UserStore>().isAdmin)
        ListTile(
          title: const Text('Configurações de Usuário'),
          leading: const Icon(Icons.settings),
          onTap: () {
            GetIt.I.get<AppRouter>().pop();
            GetIt.I.get<AppRouter>().pushNamed("/configuracao-usuario");
          }),
      if (GetIt.I.get<UserStore>().isAdmin)
        ListTile(
            title: const Text('Configurações de fornecedor'),
            leading: const Icon(Icons.manage_accounts),
            onTap: () {
              GetIt.I.get<AppRouter>().pop();
              GetIt.I.get<AppRouter>().pushNamed("/configuracao-fornecedor");
            }),
      ListTile(
          title: const Text('Histórico de fretes'),
          leading: const Icon(Icons.local_shipping),
          onTap: () => GetIt.I.get<AppRouter>().pushNamed("/historico")),
      Divider(color: Colors.grey.shade400),
      ListTile(
          title: const Text('Sobre'),
          leading: const Icon(Icons.info),
          onTap: () => GetIt.I.get<AppRouter>().pushNamed("/about")),
      ListTile(
        title: const Text('Sair'),
        leading: const Icon(Icons.logout),
        onTap: () async {
          UserStore userStore = GetIt.I.get<UserStore>();
          await userStore.logout();
          GetIt.I.get<AppRouter>().popUntilRoot();
        },
      ),
    ]));
  }
}

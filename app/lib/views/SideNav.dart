import 'package:app/views/Login.dart';
import 'package:flutter/material.dart';

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
          Navigator.of(context).pop();
        },
      ),
      ListTile(
          title: const Text('Configurações'),
          leading: const Icon(Icons.settings),
          onTap: () =>
              Navigator.of(context).pushNamed("/configuracao-usuario")),
      ListTile(
          title: const Text('Configurações de fornecedor'),
          leading: const Icon(Icons.manage_accounts),
          onTap: () =>
              Navigator.of(context).pushNamed("/configuracao-fornecedor")),
      ListTile(
          title: const Text('Histórico de fretes'),
          leading: const Icon(Icons.local_shipping),
          onTap: () => Navigator.of(context).pushNamed("/historico")),
      Divider(color: Colors.grey.shade400),
      ListTile(
          title: const Text('Sobre'),
          leading: const Icon(Icons.info),
          onTap: () => Navigator.of(context).pushNamed("/about")),
      ListTile(
        title: const Text('Sair'),
        leading: const Icon(Icons.logout),
        onTap: () async {
          await userStore.logout();
          await Navigator.pushReplacementNamed(context, '/login');
        },
      ),
    ]));
  }
}

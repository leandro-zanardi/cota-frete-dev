import 'package:app/views/Login.dart';
import 'package:flutter/material.dart';

class Sidenav extends StatelessWidget {
  const Sidenav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
        Image.asset('assets/images/bg.png'),
      const ListTile(
        title: Text('Home'),
        leading: Icon(Icons.home),
        // onTap: rota,
      ),
      const ListTile(
        title: Text('Configurações'),
        leading: Icon(Icons.settings),
        // onTap: rota,
      ),
      const ListTile(
        title: Text('Configurações de fornecedor'),
        leading: Icon(Icons.manage_accounts),
        // onTap: rota,
      ),
      const ListTile(
        title: Text('Histórico de fretes'),
        leading: Icon(Icons.local_shipping),
        // onTap: rota,
      ),
      Divider(color: Colors.grey.shade400),
      ListTile(
        title: const Text('Sobre'),
        leading: const Icon(Icons.info),
        onTap: () => Navigator.of(context).pushNamed("/about")
      ),

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

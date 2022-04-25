import 'package:app/views/Login.dart';
import 'package:flutter/material.dart';

class Sidenav extends StatelessWidget {
  const Sidenav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      // Image.asset('../assets/bg.png'),    PROBLEMA COM IMAGEM
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
      const ListTile(
        title: Text('Sobre'),
        leading: Icon(Icons.info),
        // onTap: rota,
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

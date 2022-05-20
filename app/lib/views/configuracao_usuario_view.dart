import 'package:app/components/loader_widget.dart';
import 'package:app/model/user_client.dart';
import 'package:app/store/admin_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

final AdminStore adminStore = GetIt.I.get<AdminStore>();

class ConfiguracaoUsuarioView extends StatelessWidget {
  const ConfiguracaoUsuarioView({Key? key}) : super(key: key);

  List<Widget> buildGridUsers() {
    List<Widget> usersWidgets = [];
    for (UserClient client in adminStore.userClients) {
      usersWidgets.add(
          Align(alignment: Alignment.centerLeft, child: Text(client.email)));
      usersWidgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () =>
              adminStore.registerUserAdmin(client.uuid, !client.admin),
          child: Text(client.admin ? "Desativar Admin" : "Tornar Admin"),
          style: ElevatedButton.styleFrom(
              primary: (client.admin
                  ? const Color.fromARGB(255, 147, 42, 34)
                  : const Color.fromARGB(255, 74, 70, 186))),
        ),
      ));
    }
    return usersWidgets;
  }

  @override
  Widget build(BuildContext context) {
    adminStore.updateUserClients();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações de Usuário'),
        ),
        body: Stack(children: [
              Observer(
                builder: (_) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    children: [
                      const Center(
                        child: Text("E-mail",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const Center(
                        child: Text("Ações",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      ...buildGridUsers()
                    ],
                  ),
                ),
              ),
              Observer(builder: (_) => LoaderWidget(visible: adminStore.loading))
            ]));
  }
}

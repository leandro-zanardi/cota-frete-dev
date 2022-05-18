import 'package:app/model/user_client.dart';
import 'package:app/store/admin_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

final AdminStore adminStore = GetIt.I.get<AdminStore>();

class ConfiguracaoUsuarioView extends StatelessWidget {
  const ConfiguracaoUsuarioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adminStore.updateUserClients();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const Text('Configurações de Usuário',
                    style: TextStyle(
                      height: 3,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    )),
                Observer(
                  builder: (_) {
                    return Column(children: [
                      Row(
                        children: const [Text("Email"), Text("Ações")],
                      ),
                      for (UserClient client in adminStore.userClients)
                        Row(
                          children: [
                            Text(client.email),
                            ElevatedButton(
                              onPressed: () => adminStore.registerUserAdmin(
                                  client.uuid, !client.admin),
                              child: Text(client.admin
                                  ? "Desativar Admin"
                                  : "Tornar Admin"),
                              style: ElevatedButton.styleFrom(
                                  primary: (client.admin
                                      ? Color.fromARGB(255, 147, 42, 34)
                                      : Color.fromARGB(255, 74, 70, 186))),
                            )
                          ],
                        )
                    ]);
                  },
                )
              ],
            ),
          ),
          Observer(
              builder: (_) => Visibility(
                  visible: adminStore.loading,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black45,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.3,
                            color: Colors.grey,
                            child: Stack(children: const [
                              Center(child: CircularProgressIndicator()),
                              Text("Carregando...",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))
                            ]))),
                  )))
        ]));
  }
}

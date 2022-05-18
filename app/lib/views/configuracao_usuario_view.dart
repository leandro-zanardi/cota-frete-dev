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
          Column(
            children: [
              const Text('Configurações de Usuário',
                  style: TextStyle(
                    height: 3,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  )),
              Observer(
                builder: (_) {
                  return GridView.count(crossAxisCount: 2, children: [
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
                                    ? const Color.fromARGB(255, 147, 42, 34)
                                    : const Color.fromARGB(255, 74, 70, 186))),
                          )
                        ],
                      )
                  ]);
                },
              )
            ],
          ),
          Observer(
              builder: (_) => Visibility(
                  visible: adminStore.loading,
                  child: Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black45,
                    ),
                    Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text("Carregando...",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  Center(child: CircularProgressIndicator()),
                                ]))),
                  ])))
        ]));
  }
}

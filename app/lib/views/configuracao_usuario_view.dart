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
        body: SingleChildScrollView(
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
                  return Column(
                    children: [
                      Row(
                      children: [
                        Text("UID"),
                        Text("Email"),
                        Text("Ações")
                      ],),

                      for(UserClient client in adminStore.userClients)
                        Row(
                          children: [
                            Text(client.uuid),
                            Text(client.email),
                            ElevatedButton(
                              onPressed: () {  },
                              child: Text(client.admin ? "Desativar Admin" : "Tornar Admin"),
                            )
                          ],)
                      
                    ]
                  );
                },
              )

              // const Text('Digite o id do Usuário para tornar admin',
              //     style: TextStyle(
              //         height: 5, fontSize: 20, fontWeight: FontWeight.w500)),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: TextFormField(
              //     onChanged: (value) => adminStore.setUserUUITextField(value),
              //     decoration: const InputDecoration(
              //       labelText: 'UserUUID',
              //     ),
              //   ),
              // ),
              // Observer(
              //   builder: (_) {
              //     if (!adminStore.loading) {
              //       return ElevatedButton(
              //           onPressed: () async {
              //             await adminStore.registerUserAdmin();
              //           },
              //           child: Text("Enviar"));
              //     } else {
              //       return Text("enviando...");
              //     }
              // }),
            ],
          ),
        ));
  }
}

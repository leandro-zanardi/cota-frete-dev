// ignore_for_file: prefer_const_constructors

import 'package:app/router/app_router.gr.dart';
import 'package:app/store/fornecedor_store.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

final FornecedorStore fornecedorStore = GetIt.I.get<FornecedorStore>();

class RegistroFornecedorView extends StatelessWidget {
  const RegistroFornecedorView(
      {Key? key, @QueryParam('id_fornecedor') this.idFornecedor})
      : super(key: key);

  final String? idFornecedor;

  @override
  Widget build(BuildContext context) {
    var colors2 = <Color>[
      Color.fromARGB(255, 160, 218, 215),
      Color.fromARGB(255, 0, 188, 212)
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('${(idFornecedor != null ? 'Editar' : 'Criar')} Fornecedor'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // Register

            Observer(
              builder: (_) => Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment(0.8,
                          0.0), // 10% of the width, so there are ten blinds.
                      colors: <Color>[
                        Color.fromARGB(255, 160, 218, 215),
                        Color.fromARGB(255, 0, 188, 212)
                      ]),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      (idFornecedor != null ? 'Editar' : 'Criar') + " Fornecedor",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Observer(builder: (context) {
                        return TextFormField(
                          initialValue: idFornecedor,
                            //onSaved: (String? value) => {},
                            decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Nome da empresa',
                          labelStyle: TextStyle(color: Colors.white),
                        ));
                      }),
                    ),
                    ElevatedButton(
                      onPressed: () => fornecedorStore.salvarFornecedor(idFornecedor),
                      child: Text(idFornecedor != null ? 'Salvar' : 'Cadastrar'),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/images/bg.png',
              width: 95,
              height: 95,
            )
          ],
        ),
      ),
    );
  }
}

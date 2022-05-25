import 'package:app/model/fornecedor_model.dart';
import 'package:app/router/app_router.gr.dart';
import 'package:app/store/fornecedor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

final FornecedorStore fornecedorStore = GetIt.I.get<FornecedorStore>();

class ConfiguracaoFornecedorView extends StatelessWidget {
  const ConfiguracaoFornecedorView({Key? key}) : super(key: key);

  List<Widget> buildListaFornecedores(List<FornecedorModel> fornecedores) {
    List<Widget> widgets = [];

    for (int x = 0; x < fornecedores.length; x++) {
      Widget w = Column(
        children: [
          Text(fornecedores[x].nome),
          for (int y = 0; y < fornecedores[x].origens.length; y++)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Capital"),
                    Text(fornecedores[x].origens[y].capital ? "Sim" : "Não"),
                    Text("Estado"),
                    Text(fornecedores[x].origens[y].estado)
                    ],
                ),
                Text("Destinos"),
                for (int z = 0; z< fornecedores[x].origens[y].destinos.length; z++)
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Text("Capital"),
                    Text(fornecedores[x].origens[y].destinos[z].capital ? "Sim" : "Não"),
                    Text("Estado"),
                    Text(fornecedores[x].origens[y].destinos[z].estado),
                    Text("Preço por KM"),
                    Text(fornecedores[x].origens[y].destinos[z].precoKm.toString()),
                    Text("Preço Mínimo"),
                    Text(fornecedores[x].origens[y].destinos[z].precoMin.toString()),

                ])
              ],
            )
        ],
      );
      widgets.add(w);
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    fornecedorStore.getFornecedores();

    return Scaffold(
        appBar: AppBar(
          title: const Text('configurações'),
        ),
        body: Center(
          child: Observer(
            builder: (_) => Column(
              children: [
                const Text('Configurações de Fornecedor',
                    style: TextStyle(
                      height: 3,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    )),
                 FloatingActionButton(
                    onPressed: () => GetIt.I.get<AppRouter>().pushNamed("/cadastro-fornecedor"),
                    child: Text("Cadastrar Novo Fornecedor"),
                  ),
                ...buildListaFornecedores(fornecedorStore.fornecedores.toList())
              ],
            ),
          ),
        ));
  }
}

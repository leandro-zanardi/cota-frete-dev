import 'package:app/model/fornecedor_model.dart';
import 'package:app/router/app_router.gr.dart';
import 'package:app/store/fornecedor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

final FornecedorStore fornecedorStore = GetIt.I.get<FornecedorStore>();

class ConfiguracaoFornecedorView extends StatelessWidget {
  const ConfiguracaoFornecedorView({Key? key}) : super(key: key);

  List<Widget> buildExpansionTileFornecedores() {
    List<Widget> expansionTiles = [];
    List<Widget> listaFornecedores =
        buildListaFornecedores(fornecedorStore.fornecedores.toList());
    for (int x = 0; x < listaFornecedores.length; x++) {
      expansionTiles.add(ExpansionTile(
          title: const Text('Nome do fornecedor'),
          children: [listaFornecedores[x]]));
    }
    return expansionTiles;
  }

  List<Widget> buildListaFornecedores(List<FornecedorModel> fornecedores) {
    List<Widget> widgets = [];

    for (int x = 0; x < fornecedores.length; x++) {
      Widget w = Column(
        children: [
          InkWell(
              onTap: () => GetIt.I.get<AppRouter>().pushNamed(
                  "/registro-fornecedor?id_fornecedor=${fornecedores[x].nome}"),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(fornecedores[x].nome),
              )),
          for (int y = 0; y < fornecedores[x].origens.length; y++)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 16.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                    child: Text("Origem"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Capital"),
                      Text(fornecedores[x].origens[y].capital ? "Sim" : "Não"),
                      const Text("Estado"),
                      Text(fornecedores[x].origens[y].estado)
                    ],
                  ),
                  const Text("Destinos"),
                  for (int z = 0;
                      z < fornecedores[x].origens[y].destinos.length;
                      z++)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Capital"),
                            Text(fornecedores[x].origens[y].destinos[z].capital
                                ? "Sim"
                                : "Não"),
                            const Text("Estado"),
                            Text(fornecedores[x].origens[y].destinos[z].estado),
                            const Text("Preço por KM"),
                            Text(fornecedores[x]
                                .origens[y]
                                .destinos[z]
                                .precoKm
                                .toString()),
                            const Text("Preço Mínimo"),
                            Text(fornecedores[x]
                                .origens[y]
                                .destinos[z]
                                .precoMin
                                .toString()),
                          ]),
                    ),
                ],
              ),
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
    // List<Widget> listaFornecedores =
    //     buildListaFornecedores(fornecedorStore.fornecedores.toList());

    return Scaffold(
        appBar: AppBar(
          title: const Text('configurações'),
        ),
        body: Center(
          child: Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('Configurações de Fornecedor',
                      style: TextStyle(
                        height: 3,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      )),
                  ElevatedButton(
                    onPressed: () => GetIt.I
                        .get<AppRouter>()
                        .pushNamed("/registro-fornecedor"),
                    child: const Text("Cadastrar Novo Fornecedor"),
                  ),
                  Column(children: buildExpansionTileFornecedores()),
                  // ...buildListaFornecedores(
                  //     fornecedorStore.fornecedores.toList())
                ],
              ),
            ),
          ),
        ));
  }
}

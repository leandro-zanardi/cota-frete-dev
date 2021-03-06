import 'package:app/components/auto_complete_widget.dart';
import 'package:app/components/loader_widget.dart';
import 'package:app/model/valor_model.dart';
import 'package:app/router/app_router.gr.dart';
import 'package:app/store/cotacao_store.dart';
import 'package:app/store/user.dart';
import 'package:app/views/sidenav.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

// auto complete
import 'package:maps_places_autocomplete/model/place.dart';
import 'package:mobx/mobx.dart';

import '../model/ponto_coleta_entrega.dart';

final userStore = GetIt.I.get<UserStore>();
final cotacaoStore = GetIt.I.get<CotacaoStore>();

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget buildAutocompletes(List<PontoColetaEntrega> pontosColetaEntrega) {
    List<AutocompleteWidget> autoCompletes = [];

    for (int x = 0; x < pontosColetaEntrega.length; x++) {
      autoCompletes.add(AutocompleteWidget(
        ativaModalEntrega: pontosColetaEntrega[x].ativaModalEntrega,
        ehPrimeiroPonto: pontosColetaEntrega[x].ehPrimeiroPonto,
        retornaParaOrigem: pontosColetaEntrega[x].retornaParaOrigem,
        onSuggestionClick: (Place place) =>
            cotacaoStore.onSuggestionClick(place, pontosColetaEntrega[x].id),
        ativaRetornaParaOrigem: (x == pontosColetaEntrega.length - 1),
      ));
    }

    return Column(
      children: [...autoCompletes],
    );
  }

  List<Widget> _buildValores(List<ValorModel> valores) {
    List<Widget> children = [];

    for (int x = 0; x < valores.length; x++) {
      children.add(Row(
        children: [
          Text(valores[x].fid.toString()),
          Text(valores[x].nome),
          Text(valores[x].preco.toString()),
        ],
      ));
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const Sidenav(),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Observer(builder: (_) {
                      return buildAutocompletes(
                          cotacaoStore.pontosColetaEntrega);
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan,
                            ),
                            onPressed: () =>
                                cotacaoStore.addPoint(false, false, false),
                            child: const Text("Adicionar Ponto"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan,
                            ),
                            onPressed: () => cotacaoStore.removeLastPoint(),
                            child: const Text("Remover Ponto"),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 10),
                    Observer(
                        builder: (_) => Column(
                              children: [
                                Visibility(
                                    visible:
                                        cotacaoStore.distanciaTotalRota != null,
                                    child: Row(
                                      children: [
                                        const Text("Dist??ncia Total: "),
                                        Text(cotacaoStore.distanciaTotalRota != null ? cotacaoStore.distanciaTotalRota!
                                                .toStringAsFixed(2) +
                                            ' Km' : '')
                                      ],
                                    )),
                                if (cotacaoStore.cotacao != null)
                                  ..._buildValores(
                                      cotacaoStore.cotacao!.valores)
                              ],
                            )),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                      ),
                      onPressed: () async {
                        cotacaoStore.cotar();
                      },
                      child: const Text("Cotar"),
                    ),
                    Observer(
                      builder: (_) => Text(
                        cotacaoStore.isValidToCotarErrorMessage ?? "",
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                  backgroundColor: Colors.cyan,
                  child: const Icon(Icons.map),
                  onPressed: () => GetIt.I.get<AppRouter>().pushNamed('/map')),
            ),
            Observer(
                builder: (_) => Visibility(
                    visible: userStore.permissionDeniedError != null,
                    child: Center(
                      child: SizedBox(
                        child: Material(
                          elevation: 6,
                          child: Container(
                              width: 300,
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(userStore.permissionDeniedError ?? ''),
                                  ElevatedButton(
                                      onPressed: () => userStore
                                          .setPermissionDeniedError(null),
                                      child: const Text("OK"))
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber[200],
                              )),
                        ),
                      ),
                    ))),
            Observer(
                builder: (_) => LoaderWidget(visible: cotacaoStore.loading))
          ]),
        ));
  }
}

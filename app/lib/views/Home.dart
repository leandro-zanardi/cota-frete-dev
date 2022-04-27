import 'package:app/components/auto_complete_widget.dart';
import 'package:app/model/valor_model.dart';
import 'package:app/store/cotacao_store.dart';
import 'package:app/store/user.dart';
import 'package:app/views/sidenav.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

// auto complete
import 'package:maps_places_autocomplete/model/place.dart';

import '../model/ponto_coleta_entrega.dart';

final userStore = GetIt.I.get<UserStore>();
final cotacaoStore = GetIt.I.get<CotacaoStore>();

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
    //cotacaoStore.init();

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
                            onPressed: () => cotacaoStore.addPoint(
                                'id', false, false, false),
                            child: const Text("Adicionar Ponto"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            onPressed: () => cotacaoStore.removeLastPoint(),
                            child: const Text("Remover Ponto"),
                          ),
                        ),
                      ],
                    ),
                    // Observer(
                    //   builder: (_) => Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text("Número: ${cotacaoStore.streetNumber}"),
                    //       Text("Rua: ${cotacaoStore.street}"),
                    //       Text("Cidade: ${cotacaoStore.city}"),
                    //       Text("Estado: ${cotacaoStore.state}"),
                    //     ],
                    //   ),
                    // ),
                    Container(height: 10),
                    Observer(
                        builder: (_) => Column(
                              children: [
                                if (cotacaoStore.cotacao != null)
                                  ..._buildValores(
                                      cotacaoStore.cotacao!.valores)
                              ],
                            )),
                    ElevatedButton(
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
                  child: const Icon(Icons.map),
                  onPressed: () => Navigator.of(context).pushNamed('/map')),
            )
          ]),
        ));
  }
}

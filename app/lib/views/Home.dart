import 'package:app/components/auto_complete_widget.dart';
import 'package:app/store/cotacao_store.dart';
import 'package:app/store/user.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

// auto complete
import 'package:maps_places_autocomplete/model/place.dart';

import '../model/ponto_coleta_entrega.dart';

final userStore = UserStore();
final cotacaoStore = CotacaoStore();

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget buildAutocompletes(
      List<PontoColetaEntrega> pontosColetaEntrega) {
    List<AutocompleteWidget> autoCompletes = [];

    for (int x = 0; x < pontosColetaEntrega.length; x++) {
      autoCompletes.add(AutocompleteWidget(
        ativaModalEntrega: pontosColetaEntrega[x].ativaModalEntrega,
        ehPrimeiroPonto:  pontosColetaEntrega[x].ehPrimeiroPonto,
        retornaParaOrigem:  pontosColetaEntrega[x].retornaParaOrigem,
        onSuggestionClick: (Place place) =>
            cotacaoStore.onSuggestionClick(place, pontosColetaEntrega[x].id),
        ativaRetornaParaOrigem: (x == pontosColetaEntrega.length -1),
      ));
    }

    return Column(children: [
      ...autoCompletes
    ],);
  }

  @override
  Widget build(BuildContext context) {
    cotacaoStore.init();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(
                  builder:  (_) {
                    return buildAutocompletes(cotacaoStore.pontosColetaEntrega);
                  }
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Observer(
                    builder: (_) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        onPressed: () => cotacaoStore.addPoint('id', false, false, false), 
                        child: const Text("Adicionar Ponto"),
                      ),
                    )
                  ),

                  Observer(
                    builder: (_) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        onPressed: () => cotacaoStore.removeLastPoint(), 
                        child: const Text("Remover Ponto"),
                      ),
                    )
                  ),
                ],),
                
                
                Observer(
                  builder: (_) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Número: ${cotacaoStore.streetNumber}"),
                      Text("Rua: ${cotacaoStore.street}"),
                      Text("Cidade: ${cotacaoStore.city}"),
                      Text("Estado: ${cotacaoStore.state}"),
                    ],
                  ),
                ),
                // Container(height: 100),
                // ElevatedButton(
                //   onPressed: () {
                //     print("esta logado");
                //     print(userStore.isLoggedin);
                //     print(userStore.userCredential!.user ?? "usuario nulo");
                //   },
                //   child: Text("Esta Logado"),
                // )
              ],
            ),
          ),
        ));
  }
}

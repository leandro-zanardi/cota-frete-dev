import 'dart:math';

import 'package:app/store/cotacao_store.dart';
import 'package:app/store/user.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

// auto complete
import 'package:maps_places_autocomplete/maps_places_autocomplete.dart';
import 'package:maps_places_autocomplete/model/place.dart';

final userStore = UserStore();
final cotacaoStore = CotacaoStore();

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              MapsPlacesAutocomplete(
                  mapsApiKey: 'AIzaSyAR9I6Frmuh5iyJo7xQXGmQT21Jc_B3DcE',
                  onSuggestionClick: (Place place) =>
                      cotacaoStore.onSuggestionClick(place),
                  componentCountry: 'br',
                  language: 'pt-BR'),
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
              Container(height: 100),
              
              ElevatedButton(
                onPressed: () {
                  print("esta logado");
                  print(userStore.isLoggedin);
                  print(userStore.userCredential!.user ?? "usuario nulo");
                },
                child: Text("Esta Logado"),
              )
            ],
          ),
        ),
      )
    );
  }
}

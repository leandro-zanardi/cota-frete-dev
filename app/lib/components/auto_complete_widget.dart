import 'package:flutter/material.dart';
import 'package:maps_places_autocomplete/maps_places_autocomplete.dart';
import 'package:maps_places_autocomplete/model/place.dart';
import 'package:maps_places_autocomplete/model/suggestion.dart';

class AutocompleteWidget extends StatefulWidget {
  const AutocompleteWidget(
      {Key? key,
      required this.onSuggestionClick,
      required this.ativaModalEntrega,
      required this.retornaParaOrigem,
      this.ativaRetornaParaOrigem = false,
      required this.ehPrimeiroPonto})
      : super(key: key);

  final void Function(Place place) onSuggestionClick;
  final bool ativaModalEntrega;
  final bool retornaParaOrigem;
  final bool ativaRetornaParaOrigem;
  final bool ehPrimeiroPonto;

  @override
  State<StatefulWidget> createState() => _AutocompleteWidget();
}

class _AutocompleteWidget extends State<AutocompleteWidget> {
  bool _retornaParaOrigem = false;
  int _categoria = 1;
  final Map<int, String> _categorias = {1: "Moto", 2: "Carro", 3: "Van"};

  @override
  void initState() {
    super.initState();
    _retornaParaOrigem = widget.retornaParaOrigem;
  }

  List<Widget> buildCategories() {
    List<Widget> radioElements = [];

    _categorias.entries.forEach((element) => {
          radioElements.add(Expanded(
            child: ListTile(
              horizontalTitleGap: 0,
              title: Text(element.value),
              leading: Radio<int>(
                value: element.key,
                groupValue: _categoria,
                onChanged: (int? value) {
                  setState(() {
                    _categoria = value ?? 0;
                  });
                },
              ),
            ),
          ))
        });

    return radioElements;
  }

  List<Widget> buildRetornaOrigem() {
    return [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Retorna para origem?"),
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListTile(
              title: const Text('Não'),
              leading: Radio<bool>(
                value: false,
                groupValue: _retornaParaOrigem,
                onChanged: (bool? value) {
                  setState(() {
                    _retornaParaOrigem = value ?? false;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: const Text('Sim'),
              leading: Radio<bool>(
                value: true,
                groupValue: _retornaParaOrigem,
                onChanged: (bool? value) {
                  setState(() {
                    _retornaParaOrigem = value ?? false;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MapsPlacesAutocomplete(
          mapsApiKey: 'AIzaSyAR9I6Frmuh5iyJo7xQXGmQT21Jc_B3DcE',
          onSuggestionClick: (Place place) => widget.onSuggestionClick(place),
          componentCountry: 'br',
          language: 'pt-BR',
          buildItem: (Suggestion suggestion, int index) {
            return Container(
                margin: const EdgeInsets.fromLTRB(2, 2, 2, 0),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                color: Colors.white,
                child: Text(suggestion.description));
          },
          inputDecoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: "Digite o endereço com número para melhorar a busca",
              errorText: null),
          clearButton: const Icon(Icons.close),
        ),
        if (widget.ehPrimeiroPonto)
          Column(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Veículos"),
            ),
            Row(
              children: [...buildCategories()],
            )
          ]),
        if (widget.ativaRetornaParaOrigem)
          ...buildRetornaOrigem()
      ],
    );
  }
}

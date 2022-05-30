import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  Map<String, bool> dropdownItems = {"Não": false, "Sim": true};
  final List<Map<String, dynamic>> _categorias2 = [
    {"label": "Moto", "value": true},
    {"label": "Carro", "value": false},
    {"label": "Van", "value": false}
  ];

  @override
  void initState() {
    super.initState();
    _retornaParaOrigem = widget.retornaParaOrigem;
  }

  List<Widget> _buildToggleItems() {
    List<Widget> items = [];
    for (String item
        in _categorias2.map((e) => e["label"] as String).toList()) {
      items.add(Text(item));
    }
    return items;
  }

  void _updateToogleVeicle(int index) {
    if (_categorias2[index]["value"] == false) {
      for (int x = 0; x < _categorias2.length; x++) {
        if (x == index) {
          _categorias2[x]["value"] = true;
        } else {
          _categorias2[x]["value"] = false;
        }
      }
    }
  }

  Widget buildRetornaOrigem() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Retorna para origem?"),
        ),
        DropdownButton<bool>(
          value: _retornaParaOrigem,
          items: dropdownItems.entries
              .map((item) => DropdownMenuItem<bool>(
                  value: item.value, child: Text(item.key)))
              .toList(),
          style: const TextStyle(color: Colors.grey),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: (item) =>
              setState(() => {_retornaParaOrigem = item ?? false}),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.ehPrimeiroPonto)
          Column(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Selecione o Veículo:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleButtons(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width / 3.5,
                    minHeight: 40,
                    maxWidth: 500,
                    maxHeight: 200,
                  ),
                  children: _buildToggleItems(),
                  fillColor: Colors.black12,
                  selectedColor: Colors.cyan,
                  isSelected:
                      _categorias2.map((e) => e["value"] as bool).toList(),
                  onPressed: (int index) {
                    setState(() {
                      _updateToogleVeicle(index);
                    });
                  }),
            ),
          ]),
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
        if (widget.ativaRetornaParaOrigem) buildRetornaOrigem()
      ],
    );
  }
}

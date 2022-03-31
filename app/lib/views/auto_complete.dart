import 'dart:ffi';

import 'package:app/components/auto_complete/address_search.dart';
import 'package:app/components/auto_complete/suggestion.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AutoComplete extends StatefulWidget {
  const AutoComplete({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AutoCompleteState createState() => _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  final _controller = TextEditingController();

  String? _streetNumber;
  String? _street;
  String? _city;
  String? _state;
  String? _zipCode;
  String? _vicinity;
  String? _country;
  double? _lat;
  double? _lng;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller,
              onTap: () async {
                final String sessionToken = const Uuid().v4();
                final Suggestion? result = await showSearch(
                  context: context,
                  delegate: AddressSearch(sessionToken),
                );

                //clique no resultado
                if (result != null) {
                  final placeDetails = await PlaceApiProvider(sessionToken)
                      .getPlaceDetailFromId(result.placeId);
                  setState(() {
                    _controller.text = result.description;
                    _streetNumber = placeDetails.streetNumber;
                    _street = placeDetails.street;
                    _city = placeDetails.city;
                    _state = placeDetails.state;
                    _zipCode = placeDetails.zipCode;
                    _country = placeDetails.country;
                    _vicinity = placeDetails.vicinity;
                    _lat = placeDetails.lat;
                    _lng = placeDetails.lng;
                  });
                }
              },
              decoration: InputDecoration(
                icon: Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 10,
                  height: 10,
                  child: const Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                ),
                hintText: "Entre seu endereço de entrega",
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 8.0, top: 16.0),
              ),
            ),
            SizedBox(height: 20.0),
            Text('Número: ${_streetNumber ?? '---'}'),
            Text('Endereço: ${_street ?? '---'}'),
            Text('Bairro: ${_vicinity ?? '---'}'),
            Text('Cidade: ${_city ?? '---'}'),
            Text('Estado: ${_state ?? '---'}'),
            Text('País: ${_country ?? '---'}'),
            Text('CEP: ${_zipCode ?? '---'}'),
            Text('Latitude: ${_lat ?? '---'}'),
            Text('Longitude: ${_lng ?? '---'}'),
          ],
        ));
  }
}

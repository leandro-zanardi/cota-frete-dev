import 'package:app/store/cotacao_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final CotacaoStore _cotacaoStore = GetIt.I.get<CotacaoStore>();

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mapa'),
        ),
        body: Observer(
          builder: (_) => GoogleMap(
            markers: _cotacaoStore.markers.toSet(),
            polylines: _cotacaoStore.polylines.toSet(),
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: LatLng(-23.6145455, -46.5006832),
              zoom: 10,
            ),
            onMapCreated: (GoogleMapController controller) {
              if (_cotacaoStore.cameraUpdate != null) {
                controller.animateCamera(_cotacaoStore.cameraUpdate!);
              }
            },
          ),
        ));
  }
}

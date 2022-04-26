import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  
  const MapView({Key? key}) : super(key: key);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Mapa'),
        ),
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
          },
        )
        
      );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  GoogleMapController? _mapController;
  // Set<Marker> _markers = {};

  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lngController = TextEditingController();

  void _moveToLocation(double lat, double lng) {
    _mapController?.animateCamera(CameraUpdate.newLatLng(LatLng(lat, lng)));
  }

  // void _addMarker(double lat, double lng) {
  //   final marker = Marker(
  //     markerId: const MarkerId('selected-location'),
  //     position: LatLng(lat, lng),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //   );

  //   setState(() {
  //     _markers = {marker};
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          initialCameraPosition: const CameraPosition(
              target: LatLng(-2.263626, -79.887291), zoom: 15),
          onMapCreated: (controller) {
            _mapController = controller;
          },
          // markers: _markers,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: 190,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              padding: const EdgeInsets.all(15),
              color: Colors.black87,
              child: Row(
                children: [inputs(), const SizedBox(width: 30), button()],
              ),
            ),
            botonRegresar(context),
          ],
        ),
      ],
    ));
  }

  Widget inputs() {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 80,
          child: TextFormField(
            controller: _latController,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(labelText: 'Latitud', filled: true),
          ),
        ),
        SizedBox(
          width: 200,
          height: 80,
          child: TextFormField(
            controller: _lngController,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(labelText: 'Longitud', filled: true),
          ),
        ),
      ],
    );
  }

  Widget button() {
    return ElevatedButton(
      onPressed: () {
        double lat = double.tryParse(_latController.text) ?? 0.0;
        double lng = double.tryParse(_lngController.text) ?? 0.0;
        _moveToLocation(lat, lng);
        // _addMarker(lat, lng);
      },
      style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.indigo),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            fixedSize: const MaterialStatePropertyAll(
              Size(120, 40),
            ),
          ),
          child: const Text(
            'Buscar',
            style: TextStyle(
              color: Colors.white, // Color del texto blanco
              fontSize: 17, // Tamaño de la fuente aumentado
            ),
          ),
    );
  }

  void _buscarUbicacion() {
    final lat = double.tryParse(_latController.text) ?? 0.0;
    final lng = double.tryParse(_lngController.text) ?? 0.0;
    _moveToLocation(lat, lng);
    // _addMarker(lat, lng);
  }

  Widget botonRegresar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20), // Padding solo en el lado izquierdo
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.indigo),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            fixedSize: const MaterialStatePropertyAll(
              Size(150, 60),
            ),
          ),
          child: const Text(
            'Regresar',
            style: TextStyle(
              color: Colors.white, // Color del texto blanco
              fontSize: 18, // Tamaño de la fuente aumentado
            ),
          ),
        ),
      ),
    );
  }

}

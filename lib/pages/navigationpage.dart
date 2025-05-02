import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CampusNavigationPage extends StatefulWidget {
  @override
  _CampusNavigationPageState createState() => _CampusNavigationPageState();
}

class _CampusNavigationPageState extends State<CampusNavigationPage> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Navigation')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(23.8144, 90.4125),  // Sample coordinates for NITER
          zoom: 16,
        ),
        markers: {
          Marker(
            markerId: MarkerId('niter-campus'),
            position: LatLng(23.8144, 90.4125),
            infoWindow: InfoWindow(title: 'NITER Campus'),
          ),
        },
      ),
    );
  }
}

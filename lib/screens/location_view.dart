import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loginsignup/models/locations.dart' as locations;

class locationview extends StatefulWidget {
  const locationview({Key? key}) : super(key: key);

  @override
  State<locationview> createState() => locationviewState();
}

class locationviewState extends State<locationview> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample Page'),
        backgroundColor: Colors.red[700],
      ),
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
              target: LatLng(30.168701469881825, 31.492321418410235), zoom: 20),
          markers: _markers.values.toSet()),
    );
  }
}

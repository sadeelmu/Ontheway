import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'google_map_bloc.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapBloc _bloc = GoogleMapBloc();
  GoogleMapController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          onMapCreated: (camController) {
            controller = camController;
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(32.020499918, 35.87249651),
            zoom: 14.4746,
          ),
        ),
      ),
    );
  }
}

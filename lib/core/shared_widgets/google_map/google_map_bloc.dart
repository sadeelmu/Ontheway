import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapBloc {
  LatLng _kMapCenter = LatLng(19.018255973653343, 72.84793849278007);

  CameraPosition getCameraPostions() {
    return CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  }
}

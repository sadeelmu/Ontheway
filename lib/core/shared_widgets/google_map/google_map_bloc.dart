import 'dart:async';

import 'package:beltareeq/core/enums/map_permision_enum.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapBloc {
  LatLng _kMapCenter = LatLng(19.018255973653343, 72.84793849278007);
  StreamController<MapPermission> permissionStatusController = StreamController<MapPermission>.broadcast();

  CameraPosition getCameraPostions() {
    return CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  }

  Future<void> getPermission() async {
    var permision = await Geolocator.checkPermission();
    if (permision != LocationPermission.deniedForever || permision != LocationPermission.denied) {
      Geolocator.requestPermission().then((permissionStatus) {
        if (permissionStatus != LocationPermission.deniedForever || permissionStatus != LocationPermission.denied) {
          permissionStatusController.sink.add(MapPermission.GRANTED);
        } else {
          permissionStatusController.sink.add(MapPermission.DENIED);
        }
      });
    }
  }

  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }
}

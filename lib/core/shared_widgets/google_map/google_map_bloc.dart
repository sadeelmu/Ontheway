import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:beltareeq/core/enums/map_permision_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapBloc {
  LatLng _kMapCenter = LatLng(19.018255973653343, 72.84793849278007);
  StreamController<MapPermission> permissionStatusController = StreamController<MapPermission>.broadcast();
  Marker? marker;
  Uint8List? markerlist;
  CameraPosition getCameraPostions() {
    return CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  }

  Future loadIcon() async {
    var markerBytes = await rootBundle.load("assets/images/marker.png");
    ui.Codec codec = await ui.instantiateImageCodec(markerBytes.buffer.asUint8List(), targetWidth: 700);
    ui.FrameInfo fi = await codec.getNextFrame();
    markerlist = (await fi.image.toByteData(format: ui.ImageByteFormat.png))?.buffer.asUint8List();
  }

  Set<Marker> setMarkers(Position position) {
    Set<Marker> setMarkers = {
      Marker(
          markerId: MarkerId('place_name'),
          icon: BitmapDescriptor.fromBytes(markerlist!),
          position: LatLng(position.latitude, position.longitude),
          draggable: true,
          onDrag: (_) {
            print("drage");
          },
          infoWindow: const InfoWindow(
            title: 'title',
            snippet: 'address',
          ))
    };
    return setMarkers;
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

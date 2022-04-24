import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:beltareeq/core/enums/map_permision_enum.dart';
import 'package:beltareeq/core/utils/geo_locator_methods.dart';
import 'package:beltareeq/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapComponents {
  LatLng _kMapCenter = LatLng(19.018255973653343, 72.84793849278007);
  Marker? _marker;
  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];
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

  Set<Marker> drawMarkers(Position position) {
    Set<Marker> setMarkers = {
      Marker(
          markerId: const MarkerId('place_name'),
          icon: BitmapDescriptor.fromBytes(markerlist!),
          position: LatLng(position.latitude, position.longitude),
          draggable: true,
          onDrag: (_) {},
          infoWindow: const InfoWindow(
            title: 'title',
            snippet: 'address',
          )),
      Marker(
        markerId: const MarkerId('mareker2'),
        icon: BitmapDescriptor.fromBytes(markerlist!),
        position: LatLng(37.7953883, -122.442837),
        draggable: true,
        onDrag: (_) {},
      )
    };
    return setMarkers;
  }

  Future<List<LatLng>> setPolyLinesCoordinates(Position position) async {
    List<LatLng> cord = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyBEY0b1Tjp0ujUKOk67mHGrPbKPHjG-DYc",
      PointLatLng(position.latitude, position.longitude),
      const PointLatLng(37.7953883, -122.442837),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        cord.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return cord;
  }

  Future<Set<Polyline>> drawPolyLines(Position position) async {
    return {
      Polyline(
        polylineId: const PolylineId("polyLines"),
        width: 8,
        visible: true,
        points: await setPolyLinesCoordinates(position),
        color: Colors.blue,
      )
    };
  }

  void emptyPoints() {
    polylineCoordinates.clear();
  }
}

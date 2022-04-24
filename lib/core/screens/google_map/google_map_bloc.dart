import 'dart:async';

import 'package:beltareeq/core/enums/map_permision_enum.dart';
import 'package:beltareeq/core/utils/geo_locator_methods.dart';
import 'package:beltareeq/core/utils/map_components.dart';
import 'package:beltareeq/locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapBloc {
  StreamController<MapPermission> permissionStatusController = StreamController<MapPermission>.broadcast();

  Future<void> getPermission() async {
    permissionStatusController.sink.add(await locator<GeoLocatorMethods>().getPermission());
  }

  Set<Marker> drawMarkers(Position position) {
    return locator<MapComponents>().drawMarkers(position);
  }

  Future<Set<Polyline>> drawePolyLines(Position position) async {
    var polyline = locator<MapComponents>().drawPolyLines(position);
    return polyline;
  }
}

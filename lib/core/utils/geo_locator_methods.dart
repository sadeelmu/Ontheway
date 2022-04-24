import 'package:beltareeq/core/utils/map_components.dart';
import 'package:geolocator/geolocator.dart';

import '../../locator.dart';
import '../enums/map_permision_enum.dart';

class GeoLocatorMethods {
  Future<Position> getCurrentPosition() async {
    try {
      var cordinates = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      return cordinates;
    } catch (e) {
      return Position(
          longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0);
    }
  }

  Future<MapPermission> getPermission() async {
    var permision = await Geolocator.checkPermission();
    if (permision != LocationPermission.deniedForever || permision != LocationPermission.denied) {
      return Geolocator.requestPermission().then((permissionStatus) {
        if (permissionStatus != LocationPermission.deniedForever || permissionStatus != LocationPermission.denied) {
          return MapPermission.GRANTED;
        } else {
          return MapPermission.DENIED;
        }
      });
    } else {
      return MapPermission.GRANTED;
    }
  }
}

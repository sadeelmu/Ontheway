import 'package:beltareeq/core/utils/geo_locator_methods.dart';
import 'package:beltareeq/core/utils/map_components.dart';
import 'package:beltareeq/core/utils/view_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ViewObserver>(ViewObserver());
  locator.registerSingleton<GeoLocatorMethods>(GeoLocatorMethods());
  locator.registerSingleton<MapComponents>(MapComponents());
}

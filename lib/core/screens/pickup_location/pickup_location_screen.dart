import 'package:beltareeq/core/enums/view_enum.dart';
import 'package:beltareeq/core/utils/custom_map_search_screen.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../utils/view_observer.dart';

class LocationPickup extends StatefulWidget {
  LocationPickup({Key? key}) : super(key: key);

  @override
  State<LocationPickup> createState() => _LocationPickupState();
}

class _LocationPickupState extends State<LocationPickup> {
  @override
  Widget build(BuildContext context) {
    return CustomMapSearchScreen(
      hasButton: true,
      buttonText: "Confirm PickUp",
      searchHintText: "My location",
      buttonTab: () {
        locator<ViewObserver>().rebuildViews(ViewEnum.DROPPOFF);
      },
    );
  }
}

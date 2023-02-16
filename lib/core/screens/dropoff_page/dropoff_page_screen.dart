import 'package:beltareeq/core/enums/view_enum.dart';
import 'package:beltareeq/core/utils/view_observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:beltareeq/core/constants/routers_constants.dart';
import 'package:beltareeq/core/utils/custom_map_search_screen.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';

class DropoffLocation extends StatefulWidget {
  const DropoffLocation({Key? key}) : super(key: key);

  @override
  _DropoffLocationState createState() => _DropoffLocationState();
}

class _DropoffLocationState extends State<DropoffLocation> {
  @override
  Widget build(BuildContext context) {
    return CustomMapSearchScreen(
      hasButton: true,
      onSearchTap: () {
        Navigator.pushNamed(context, RoutesConstants.location_search_page);
      },
      buttonText: "Confirm Dropoff location",
      searchHintText: "Where to go",
      buttonTab: () {
        locator<ViewObserver>().rebuildViews(ViewEnum.RIDE_OPTIONS);
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:beltareeq/core/constants/routers_constants.dart';
import 'package:beltareeq/core/utils/custom_map_search_screen.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/custom_text.dart';
import '../../shared_widgets/google_map/google_map_screen.dart';

class DropoffLocation extends StatefulWidget {
  const DropoffLocation({Key? key}) : super(key: key);

  @override
  _DropoffLocationState createState() => _DropoffLocationState();
}

class _DropoffLocationState extends State<DropoffLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.color_0xffffffff,
        appBar: BaseAppBar(
            backgroundColor: ColorConstants.color_0xffffffff,
            coloredfirstTextColor: ColorConstants.color_0xff1A5AD9,
            isToLined: false,
            secondeText: "Drop Off Location",
            secondeTextColor: Colors.black,
            avatarColor: ColorConstants.color_0xff1A5AD9,
            iconColor: ColorConstants.color_0xffffffff,
            hasBackIcon: true),
        body: CustomMapSearchScreen(
          hasButton: true,
          buttonTab: () {
            Navigator.pushNamed(context, RoutesConstants.location_pickup);
          },
        )
    );
  }
}

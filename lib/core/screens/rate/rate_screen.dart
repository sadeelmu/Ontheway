import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:beltareeq/core/constants/routers_constants.dart';
import 'package:beltareeq/core/services/mock_services.dart';
import 'package:beltareeq/core/shared_widgets/saved_location_tile.dart';
import 'package:beltareeq/core/utils/custom_map_search_screen.dart';
import 'package:flutter/material.dart';
import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/custom_text.dart';

class RateScreen extends StatefulWidget {
  RateScreen({Key? key}) : super(key: key);

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.color_0xffffffff,
      appBar: BaseAppBar(
        additionalWidget: CircleAvatar(
          backgroundColor: ColorConstants.color_0xffb0bfb,
          radius: 35,
          
        ),
        leadingActionTap: () {
          Navigator.pop(context); //no need for false because we dont need it to return a value from this route
        },
        backgroundColor: ColorConstants.color_0xff1A5AD9,
        coloredfirstTextColor: ColorConstants.color_0xf0000000,
        isToLined: false,
        hasCircularBorder: true,
        firstText: "You are in place",
        avatarColor: ColorConstants.color_0xffffffff,
        iconColor: ColorConstants.color_0xff1A5AD9,
        hasBackIcon: true,
        toolbarHeight: 500,
      ),
    );
  }
}

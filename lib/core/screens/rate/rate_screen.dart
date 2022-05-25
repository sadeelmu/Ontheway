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
        body: Container(
          height: 500,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ColorConstants.color_0xff1A5AD9,
                    borderRadius: new BorderRadius.vertical(
                      bottom: new Radius.elliptical(MediaQuery.of(context).size.width, 90.0),
                    )),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(15),
                              onTap: () {},
                              child: CircleAvatar(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: ColorConstants.color_0xff1A5AD9,
                                  ),
                                  backgroundColor: ColorConstants.color_0xffffffff),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                CustomText(
                                  title: "You are in place",
                                  style: TextStyle(
                                      color: ColorConstants.color_0xff1A5AD9, fontSize: 12, fontWeight: FontWeight.bold),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: MediaQuery.of(context).size.width / 2.3,
                child: CircleAvatar(
                  radius: ,
                  backgroundColor: Colors.green,
                ),
              )
            ],
          ),
        ));
  }
}

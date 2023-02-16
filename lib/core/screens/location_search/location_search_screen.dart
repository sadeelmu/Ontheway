import 'dart:async';

import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:beltareeq/core/constants/routers_constants.dart';
import 'package:beltareeq/core/services/mock_services.dart';
import 'package:beltareeq/core/shared_widgets/saved_location_tile.dart';
import 'package:beltareeq/core/utils/custom_map_search_screen.dart';
import 'package:flutter/material.dart';
import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/custom_text.dart';

class LocationSearchScreen extends StatefulWidget {
  const LocationSearchScreen({Key? key}) : super(key: key);

  @override
  _LocationSearchScreenState createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  StreamController<bool> streamController = StreamController<bool>.broadcast();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.color_0xffffffff,
        appBar: BaseAppBar(
            additionalWidget: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.05))
                  ]),
              child: TextField(
                  readOnly: true,
                  onTap: () {
                    streamController.sink.add(true);
                  },
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: ColorConstants.color_0xff707070,
                      ),
                      contentPadding: EdgeInsets.only(bottom: 0, left: 12),
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: "Search",
                      border: InputBorder.none,
                      alignLabelWithHint: true)),
            ),
            leadingActionTap: () {
              Navigator.pop(context, false);
            },
            backgroundColor: ColorConstants.color_0xff1A5AD9,
            coloredfirstTextColor: ColorConstants.color_0xffffffff,
            isToLined: true,
            coloresfirstText: "User",
            hasCircularBorder: true,
            secondeText: "Dropoff Location",
            secondeTextColor: ColorConstants.color_0xffffffff,
            avatarColor: ColorConstants.color_0xffffffff,
            iconColor: ColorConstants.color_0xff1A5AD9,
            hasBackIcon: true),
        body: StreamBuilder<bool>(
            initialData: false,
            stream: streamController.stream,
            builder: (context, snapshot) {
              return snapshot.data!
                  ? Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: ColorConstants.color_0xff1A5AD9,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        ColorConstants.color_0xffffffff,
                                    child: Icon(
                                      Icons.star_outline,
                                      color: ColorConstants.color_0xff1A5AD9,
                                    ),
                                  ),
                                ),
                                CustomText(
                                  shouldFit: false,
                                  title: "Saved Places",
                                  style: TextStyle(
                                      color: ColorConstants.color_0xffffffff,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                for (int i = 0;
                                    i < MockService().savedmockLoction.length;
                                    i++)
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SavedLocationTiles(
                                            subtitle: MockService()
                                                .savedmockLoction[i]
                                                .locationSubTitle,
                                            title: MockService()
                                                .savedmockLoction[i]
                                                .locationName,
                                            callBack: (value) {
                                              Navigator.pop(context, true);
                                            }),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: ColorConstants.color_0xff1A5AD9,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        ColorConstants.color_0xffffffff,
                                    child: Icon(
                                      Icons.location_city_outlined,
                                      color: ColorConstants.color_0xff1A5AD9,
                                    ),
                                  ),
                                ),
                                CustomText(
                                  shouldFit: false,
                                  title: "Recent Places",
                                  style: TextStyle(
                                      color: ColorConstants.color_0xffffffff,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                for (int i = 0;
                                    i < MockService().recentmockLoction.length;
                                    i++)
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SavedLocationTiles(
                                            title: MockService()
                                                .recentmockLoction[i]
                                                .locationName,
                                            subtitle: MockService()
                                                .recentmockLoction[i]
                                                .locationSubTitle,
                                            callBack: (value) {
                                              Navigator.pop(context, true);
                                            }),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container();
            }));
  }
}

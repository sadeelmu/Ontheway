import 'dart:async';

import 'package:beltareeq/core/custom_widgets/custom_text.dart';
import 'package:beltareeq/core/screens/location_search/location_search_bloc.dart';
import 'package:beltareeq/core/services/mock_services.dart';
import 'package:beltareeq/core/shared_widgets/location_search_tile.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class LocationSearchScreen extends StatefulWidget {
  const LocationSearchScreen({Key? key}) : super(key: key);

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  StreamController<bool> shouldShowListController = StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.color_0xff003B8E,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          title: "Dropoff Location",
          style: TextStyle(color: ColorConstants.color_0xffffffff, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: const Icon(
                Icons.arrow_back_outlined,
                color: ColorConstants.color_0xff003B8E,
                size: 25,
              ),
              backgroundColor: ColorConstants.color_0xffffffff,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [BoxShadow(spreadRadius: 5, blurRadius: 5, color: Colors.black.withOpacity(0.05))]),
                      child: TextField(
                          readOnly: true,
                          onTap: () {
                            shouldShowListController.sink.add(true);
                          },
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                color: ColorConstants.color_0xff707070,
                              ),
                              contentPadding: EdgeInsets.only(bottom: 5, left: 12),
                              hintStyle: TextStyle(fontWeight: FontWeight.normal),
                              hintText: "Where to?",
                              border: InputBorder.none,
                              alignLabelWithHint: true)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,

              ),



              StreamBuilder<bool>(
                  stream: shouldShowListController.stream,
                  initialData: false,
                  builder: (context, snapshot) {
                    if (snapshot.data ?? false) {
                      return Expanded(

                        child: ListView.builder(
                          itemBuilder: (context, count) {
                            return Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                Row(
                                  children: [
                                    CircleAvatar(child: Icon(Icons.favorite_rounded, color: ColorConstants.color_0xffffffff,),backgroundColor: ColorConstants.color_0xff003B8E,),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(children: [
                                      CustomText(
                                        title: "Saved Places",
                                        style: TextStyle(),
                                        shouldFit: false,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ]),
                                  ],
                                ),
                                  Divider(
                                    color: ColorConstants.color_0xff003B8E,
                                  ),
                                  LocationSearchTile(),

                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(child: Icon(Icons.history, color: ColorConstants.color_0xffffffff,),backgroundColor: ColorConstants.color_0xff003B8E,),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(children: [
                                        CustomText(
                                          title: "Recent Places",
                                          style: TextStyle(),
                                          shouldFit: false,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ]),
                                    ],
                                  ),
                                  Divider(
                                    color: ColorConstants.color_0xff003B8E,
                                  ),
                                  LocationSearchTile(),
                                ],
                              ),
                            );
                          },
                          itemCount: MockService().mockLoction.length,
                          padding: const EdgeInsets.all(5),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

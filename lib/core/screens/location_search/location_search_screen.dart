import 'dart:async';

import 'package:beltareeq/core/custom_widgets/custom_text.dart';
import 'package:beltareeq/core/screens/location_search/location_search_bloc.dart';
import 'package:beltareeq/core/services/mock_services.dart';
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
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          title: "Dropoff location",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
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
                              hintText: "Where to go",
                              border: InputBorder.none,
                              alignLabelWithHint: true)),
                    ),
                  ),
                ],
              ),
                StreamBuilder<bool>(
                  stream: shouldShowListController.stream,
                  initialData: false,
                  builder: (context, snapshot) {
                    if(snapshot.data?? false){
                      return ListView.builder(itemBuilder: (context,count){
                        return Container(
                          child: Column(
                            children: [
                              CustomText(title: MockService().mockLoction[count].locationName, style: null),
                              CustomText(title: MockService().mockLoction[count].locationSubTitle, style: null)],
                          ),
                        );
                      },
                        itemCount: MockService().mockLoction.length,
                        padding: const EdgeInsets.all(5),

                      );
                    } else{
                      return Container();
                    }

                  }
                ),
            ],

          ),
        ),
      ),
    );

  }
}

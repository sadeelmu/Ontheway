import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:beltareeq/core/constants/routers_constants.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/custom_text.dart';
import '../../shared_widgets/google_map/google_map_screen.dart';
import 'destination_page_bloc.dart';

class DestinationPageScreen extends StatefulWidget {
  DestinationPageScreen({Key? key}) : super(key: key);

  @override
  State<DestinationPageScreen> createState() => _DestinationPageScreenState();
}

class _DestinationPageScreenState extends State<DestinationPageScreen> {
  DestinationPageBloc bloc = DestinationPageBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.color_0xffffffff,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 350,
            shadowColor: Colors.white,
            title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
                    text: "Good morning, ",
                    children: [
                      TextSpan(
                        text: bloc.name,
                        style: TextStyle(color: ColorConstants.color_0xff003B8E, fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
              CustomText(
                title: "Where are you going?",
                style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ]),
            backgroundColor: Colors.white,
          )),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(width: MediaQuery.of(context).size.width, child: GoogleMapScreen()),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 100,
                      spreadRadius: 50,
                    )
                  ]),
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(
                          18,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(spreadRadius: 5, blurRadius: 5, color: Colors.black.withOpacity(0.05))
                                      ]),
                                  height: MediaQuery.of(context).size.height * 0.06,
                                  child: TextField(
                                      readOnly: true,
                                      onTap: () {
                                        Navigator.pushNamed(context, RoutesConstants.location_search_page);
                                      },
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.search,
                                            color: ColorConstants.color_0xff707070,
                                          ),
                                          contentPadding: EdgeInsets.only(bottom: 0, left: 12),
                                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                          hintText: "Where to go",
                                          border: InputBorder.none,
                                          alignLabelWithHint: true))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

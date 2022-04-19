import 'package:beltareeq/core/constants/color_constants.dart';
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
      backgroundColor: ColorConstants.color_0xfff5f1e3,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 350,
            title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal),
                    text: "Good morning, ",
                    children: [
                      TextSpan(
                        text: bloc.name,
                        style: TextStyle(color: ColorConstants.color_0xff003B8E, fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
              CustomText(
                title: "Where are you going?",
                style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ]),
            backgroundColor: ColorConstants.color_0xfff5f1e3,
          )),
      body: GoogleMapScreen(),
    );
  }
}

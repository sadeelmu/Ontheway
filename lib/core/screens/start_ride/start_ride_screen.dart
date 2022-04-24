import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:beltareeq/core/screens/home_page/home_page_bloc.dart';
import 'package:beltareeq/core/services/mock_services.dart';
import 'package:beltareeq/core/shared_widgets/location_container.dart';
import 'package:beltareeq/core/shared_widgets/ride_options_widget.dart';
import 'package:flutter/material.dart';
import '../../custom_widgets/custom_text.dart';

class StartRideScreen extends StatefulWidget {
  const StartRideScreen({Key? key}) : super(key: key);

  @override
  State<StartRideScreen> createState() => _StartRideScreenState();
}

class _StartRideScreenState extends State<StartRideScreen> {
  HomePageBloc bloc = HomePageBloc();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(alignment: Alignment.topCenter, child: LocationContianer()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 23, right: 23),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 80,
                              height: 3,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Your Driver from ",
                                  style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                                  children: [
            
                                    TextSpan(
                                      //if uber 
                                        // text: "Uber:",
                                        // style: TextStyle(
                                        //     color: ColorConstants.color_0xf0000000 fontSize: 12, fontWeight: FontWeight.bold)
                                        //if jeeny
                                        text: "Jeeny:",
                                        style: TextStyle(
                                            color: ColorConstants.color_0xff1A5AD9, fontSize: 12, fontWeight: FontWeight.bold)
                                        //if careem
                                        // text: "Careem:",
                                        // style: TextStyle(
                                        //     color: ColorConstants.color_0xf3cb44c, fontSize: 12, fontWeight: FontWeight.bold)
                                        )
                                  ]),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                                      child: Icon(
                                        Icons.car_repair_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            shouldFit: true,
                                            title: "Name Name",
                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star_outline,
                                              color: ColorConstants.color_0xff1A5AD9,
                                              size: 14,
                                            ),
                                            CustomText(
                                                title: "4.9",
                                                style: TextStyle(
                                                    color: ColorConstants.color_0xff1A5AD9,
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: 10)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                CustomText(
                                    title: "1.5 JD",
                                    style: TextStyle(
                                        color: ColorConstants.color_0xff1A5AD9, fontWeight: FontWeight.bold, fontSize: 16)),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                //icons here
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.message_outlined),
                                  Icon(Icons.cancel_outlined),
                                ]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                                //text here
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                      title: "Message",
                                      style: TextStyle(
                                          color: ColorConstants.color_0xff1A5AD9, fontWeight: FontWeight.bold, fontSize: 10)),
                                  CustomText(
                                      title: "Cancel Trip",
                                      style: TextStyle(
                                        color: ColorConstants.color_0xff1A5AD9,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      )),
                                ]),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

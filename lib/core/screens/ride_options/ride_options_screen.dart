import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:beltareeq/core/screens/home_page/home_page_bloc.dart';
import 'package:beltareeq/core/services/mock_services.dart';
import 'package:beltareeq/core/shared_widgets/google_map/google_map_screen.dart';
import 'package:beltareeq/core/shared_widgets/ride_options_widget.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/custom_text.dart';

class RideOptionsScreen extends StatefulWidget {
  const RideOptionsScreen({Key? key}) : super(key: key);

  @override
  State<RideOptionsScreen> createState() => _RideOptionsScreenState();
}

class _RideOptionsScreenState extends State<RideOptionsScreen> {
  HomePageBloc bloc = HomePageBloc();
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  backgroundColor: ColorConstants.color_0xff003B8E,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: bloc.name,
                        style: TextStyle(color: ColorConstants.color_0xff003B8E, fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ]),
                  ),
                  CustomText(
                    title: "Choose The Best Price",
                    style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ]),
              ],
            ),
            backgroundColor: ColorConstants.color_0xffffffff,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFFFFFF),
                            boxShadow: [BoxShadow(spreadRadius: 5, blurRadius: 5, color: Colors.black.withOpacity(0.05))]),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(
                            18,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: "History -7th Circle, Amman",
                                    style: TextStyle(
                                        color: ColorConstants.color_0xff003B8E, fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                  CustomText(
                                    title: "Home",
                                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: FittedBox(
                                          fit: BoxFit.fill,
                                          child: CustomText(
                                            title: "History -To - Al-Shaymaa As-Saadeyah St., Amman",
                                            style: TextStyle(
                                                color: ColorConstants.color_0xff003B8E,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomText(
                                    title: "Psut",
                                    style: TextStyle(
                                        color: ColorConstants.color_0xff003B8E, fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
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
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                      title: "Select an option : ",
                                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                                  Icon(
                                    Icons.settings_outlined,
                                    color: ColorConstants.color_0xff003B8E,
                                    size: 30,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              for (var ride in MockService().rideOptionModel)
                                RideOptionWidget(
                                  image: ride.image,
                                  isBestPrice: ride.isBestPrice,
                                  price: ride.price,
                                  time: ride.time,
                                  color: ride.color,
                                ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

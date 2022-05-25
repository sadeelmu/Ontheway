import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:beltareeq/core/constants/routers_constants.dart';
import 'package:beltareeq/core/screens/home_page/home_page_bloc.dart';
import 'package:beltareeq/core/services/mock_services.dart';
import 'package:beltareeq/core/shared_widgets/location_container.dart';
import 'package:beltareeq/core/shared_widgets/ride_options_widget.dart';
import 'package:beltareeq/core/utils/view_observer.dart';
import 'package:beltareeq/locator.dart';
import 'package:flutter/material.dart';
import '../../custom_widgets/custom_text.dart';

class FinishRideScreen extends StatefulWidget {
  const FinishRideScreen({Key? key}) : super(key: key);

  @override
  State<FinishRideScreen> createState() => _FinishRideScreenState();
}

class _FinishRideScreenState extends State<FinishRideScreen> {
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 3,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ColorConstants.color_0xffffffff,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(blurRadius: 10, spreadRadius: 0.1, color: Colors.black.withOpacity(0.2))]),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                CustomText(
                                  title: "You Have Saved ",
                                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  title: "1.0 JD",
                                  style: const TextStyle(
                                      color: ColorConstants.color_0xff1A5AD9, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  title: "Payment made successfully",
                                  style: const TextStyle(
                                      color: ColorConstants.color_0xff707070, fontSize: 16, fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: CustomText(
                                title: "Skip",
                                shouldFit: true,
                                style: const TextStyle(
                                    color: ColorConstants.color_0xff1A5AD9, fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, RoutesConstants.rate_screen);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Container(
                                    color: ColorConstants.color_0xff1A5AD9,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    height: 45,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(12),
                                    child: CustomText(
                                      shouldFit: false,
                                      title: "Rate",
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

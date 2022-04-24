import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:beltareeq/core/enums/view_enum.dart';
import 'package:beltareeq/core/screens/home_page/home_page_bloc.dart';
import 'package:beltareeq/core/services/mock_services.dart';
import 'package:beltareeq/core/shared_widgets/location_container.dart';
import 'package:beltareeq/core/shared_widgets/ride_options_widget.dart';
import 'package:beltareeq/core/utils/view_observer.dart';
import 'package:beltareeq/locator.dart';
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
    return Stack(
      children: [
        Align(alignment: Alignment.topCenter, child: LocationContianer()),
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
                            color: ColorConstants.color_0xff1A5AD9,
                            size: 30,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      for (var ride in MockService().rideOptionModel)
                        InkWell(
                          onTap: () {
                            locator<ViewObserver>().rebuildViews(ViewEnum.START_RIDE);
                          },
                          child: RideOptionWidget(
                            image: ride.image,
                            isBestPrice: ride.isBestPrice,
                            price: ride.price,
                            time: ride.time,
                          ),
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
    );
  }
}

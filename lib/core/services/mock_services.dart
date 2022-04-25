import 'dart:io';

import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:beltareeq/core/models/mock_location_model.dart';

class MockService {
  List<LocationModel> savedmockLoction = [
    LocationModel(isFavrite: false, locationName: "Work", locationSubTitle: "Abdali"),
    LocationModel(isFavrite: false, locationName: "University", locationSubTitle: "Queen Rania Street"),
    LocationModel(isFavrite: true, locationName: "Home", locationSubTitle: "Khelda"),
  ];
  List<LocationModel> recentmockLoction = [
    LocationModel(isFavrite: true, locationName: "Beyond Limits", locationSubTitle: "Abdali"),
    LocationModel(isFavrite: false, locationName: "PSUT", locationSubTitle: "Queen Rania Street"),
    LocationModel(isFavrite: true, locationName: "Home", locationSubTitle: "Khelda")
  ];
  List<RideOptionsMockModel> rideOptionModel = [
    RideOptionsMockModel("Uber",
        image: "assets/images/uper.png",
        isBestPrice: true,
        price: "3.5jd",
        time: "2 min",
        color: ColorConstants.color_0xf0000000),
    RideOptionsMockModel("Jeeny",
        image: "assets/images/jeeny.png",
        isBestPrice: false,
        price: "3jd",
        time: "10 min",
        color: ColorConstants.color_0xffb0bfb),
    RideOptionsMockModel("Careem",
        image: "assets/images/careem.png",
        isBestPrice: false,
        price: "4jd",
        time: "10 min",
        color: ColorConstants.color_0xf3cb44c)
  ];
}

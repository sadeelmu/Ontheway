import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:beltareeq/core/models/mock_location_model.dart';

class MockService {
  List<LocationModel> mockLoction = [
    LocationModel(isFavrite: true, locationName: "Home", locationSubTitle: "seventh Circle"),
    LocationModel(isFavrite: false, locationName: "PSUT", locationSubTitle: "Queen Rania Street"),

  ];
  List<RideOptionsMockModel> rideOptionModel = [
    RideOptionsMockModel(
        image: "assets/images/uper.png", isBestPrice: true, price: "2jd", time: "2 min", color: ColorConstants.color_0xf0000000),
    RideOptionsMockModel(
        image: "assets/images/jeeny.png", isBestPrice: false, price: "4jd", time: "5 min", color: ColorConstants.color_0xffb0bfb),
    RideOptionsMockModel(
        image: "assets/images/careem.png",
        isBestPrice: false,
        price: "3jd",
        time: "10 min",
        color: ColorConstants.color_0xf3cb44c)
  ];

}


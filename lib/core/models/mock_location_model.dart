import 'package:flutter/cupertino.dart';

class LocationModel {
  final String? locationName;
  final String? locationSubTitle;
  final bool? isFavrite;
  LocationModel({this.locationName, this.locationSubTitle, this.isFavrite});
}

class RideOptionsMockModel {
  final String? image;
  final String? price;
  final String? time;
  final bool? isBestPrice;
  final Color? color;
  RideOptionsMockModel({this.image, this.price, this.time, this.isBestPrice, this.color});
}

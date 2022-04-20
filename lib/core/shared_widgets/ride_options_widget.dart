import 'package:beltareeq/core/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class RideOptionWidget extends StatelessWidget {
  const RideOptionWidget({Key? key, this.price, this.image, this.time, this.isBestPrice}) : super(key: key);
  final String? price;
  final String? image;
  final String? time;
  final bool? isBestPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.car_rental),
            SizedBox(
              width: 10,
            ),
            Column(children: [
              Image.asset(
                image!,
              ),
              SizedBox(
                height: 5,
              ),
              CustomText(
                title: isBestPrice! ? "Best Price" : "",
                style: TextStyle(),
                shouldFit: false,
              ),
            ]),
          ],
        ),
        Column(children: [
          CustomText(
            title: price,
            style: TextStyle(),
            shouldFit: false,
          ),
          CustomText(
            title: time,
            style: TextStyle(),
            shouldFit: false,
          ),
        ]),
      ],
    );
  }
}

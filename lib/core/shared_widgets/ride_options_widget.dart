import 'package:beltareeq/core/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class RideOptionWidget extends StatelessWidget {
  const RideOptionWidget({Key? key, this.price, this.image, this.time, this.isBestPrice, this.color, this.callback})
      : super(key: key);
  final String? price;
  final String? image;
  final String? time;
  final bool? isBestPrice;
  final Color? color;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          callback!();
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.car_rental),
                  SizedBox(
                    width: 10,
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image.asset(
                      image!,
                    ),
                    isBestPrice!
                        ? SizedBox(
                            height: 5,
                          )
                        : Container(),
                    isBestPrice!
                        ? CustomText(
                            title: "Best Price",
                            style: TextStyle(),
                            shouldFit: false,
                          )
                        : Container()
                  ]),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                CustomText(
                  title: price,
                  style: TextStyle(color: color),
                  shouldFit: false,
                ),
                SizedBox(
                  height: 2,
                ),
                CustomText(
                  title: time,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  shouldFit: false,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

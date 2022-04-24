import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../custom_widgets/custom_text.dart';

class LocationContianer extends StatelessWidget {
  const LocationContianer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      style: TextStyle(color: ColorConstants.color_0xff1A5AD9, fontSize: 12, fontWeight: FontWeight.bold),
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
                              style: TextStyle(color: ColorConstants.color_0xff1A5AD9, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomText(
                      title: "Psut",
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

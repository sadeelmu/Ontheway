import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../custom_widgets/custom_text.dart';

class SavedLocationTiles extends StatelessWidget {
  const SavedLocationTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Icon(Icons.location_pin),
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
    );
  }
}

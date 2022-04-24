import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../custom_widgets/custom_text.dart';

class SavedLocationTiles extends StatelessWidget {
  const SavedLocationTiles({Key? key, this.title = "", this.subtitle = "", this.callBack}) : super(key: key);
  final String? title;
  final String? subtitle;
  final Function(String value)? callBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callBack!(subtitle!);
      },
      child: Container(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: CircleAvatar(
                child: Icon(Icons.location_pin),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                        shouldFit: false,
                        title: title,
                        style: TextStyle(color: ColorConstants.color_0xff1A5AD9, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  CustomText(
                    shouldFit: true,
                    title: subtitle,
                    style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

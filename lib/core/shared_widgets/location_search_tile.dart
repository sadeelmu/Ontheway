import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class LocationSearchTile extends StatefulWidget {
  const LocationSearchTile({Key? key, this.isSaved}) : super(key: key);
  final bool? isSaved;

  @override
  _LocationSearchTileState createState() => _LocationSearchTileState();
}

class _LocationSearchTileState extends State<LocationSearchTile> {
  @override
  Widget build(BuildContext context) {


    return Row(
      children: [
        CircleAvatar(child: Icon(Icons.add_location, color: ColorConstants.color_0xffffffff,), backgroundColor: ColorConstants.color_0xff1A5AD9),
        SizedBox(
          width: 10,
        ),
        Column(children: [
          CustomText(
            title:  "PSUT",
            style: TextStyle(),
            shouldFit: false,

          ),
          SizedBox(
            height: 5,
          ),
        ]

        ),
      ],

    );

  

    // return Row(
    //   children: [
    //     Icon(Icons.add_location),
    //     SizedBox(
    //       width: 10,
    //     ),
    //     Column(children: [
    //       CustomText(
    //           title: "PSUT",
    //         style: TextStyle()
    //       ),
    //       SizedBox(
    //         height:10,
    //       ),
    //     ]),
    //   ],
    // );

  
    
    
  }
}


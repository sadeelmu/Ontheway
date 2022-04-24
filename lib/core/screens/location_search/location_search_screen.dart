import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:beltareeq/core/constants/routers_constants.dart';
import 'package:beltareeq/core/services/mock_services.dart';
import 'package:beltareeq/core/utils/custom_map_search_screen.dart';
import 'package:flutter/material.dart';
import '../../custom_widgets/custom_app_bar.dart';

class LocationSearchScreen extends StatefulWidget {
  const LocationSearchScreen({Key? key}) : super(key: key);

  @override
  _LocationSearchScreenState createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.color_0xffffffff,
        appBar: BaseAppBar(
            additionalWidget: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [BoxShadow(spreadRadius: 5, blurRadius: 5, color: Colors.black.withOpacity(0.05))]),
              child: TextField(
                  readOnly: true,
                  onTap: () {},
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: ColorConstants.color_0xff707070,
                      ),
                      contentPadding: EdgeInsets.only(bottom: 0, left: 12),
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: "search",
                      border: InputBorder.none,
                      alignLabelWithHint: true)),
            ),
            backgroundColor: ColorConstants.color_0xff1A5AD9,
            coloredfirstTextColor: ColorConstants.color_0xff1A5AD9,
            isToLined: true,
            firstText: "AJ",
            firstTextColor: ColorConstants.color_0xffffffff,
            hasCircularBorder: true,
            secondeText: "Drop Off Location",
            secondeTextColor: ColorConstants.color_0xffffffff,
            avatarColor: ColorConstants.color_0xff1A5AD9,
            iconColor: ColorConstants.color_0xffffffff,
            hasBackIcon: true),
        body: ListView.builder(
            itemCount: MockService().mockLoction.length,
            itemBuilder: (context, index) {
              return Container();
            }));
  }
}

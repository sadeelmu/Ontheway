import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/routers_constants.dart';
import '../custom_widgets/custom_text.dart';
import '../shared_widgets/google_map/google_map_screen.dart';

class CustomMapSearchScreen extends StatelessWidget {
  const CustomMapSearchScreen(
      {Key? key,
      this.onSearchTap,
      this.hasButton,
      this.textEditingController,
      this.buttonTab,
      this.buttonText = "",
      this.searchHintText = ""})
      : super(key: key);
  final VoidCallback? onSearchTap;
  final String? buttonText;
  final String? searchHintText;

  final VoidCallback? buttonTab;
  final bool? hasButton;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.color_0xffffffff,
      body: Column(
        children: [
          Expanded(
            child: Stack(children: [
              Container(width: MediaQuery.of(context).size.width, child: const GoogleMapScreen()),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 100,
                    spreadRadius: 50,
                  )
                ]),
                height: 20,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(
                        18,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(spreadRadius: 5, blurRadius: 5, color: Colors.black.withOpacity(0.05))
                                    ]),
                                height: MediaQuery.of(context).size.height * 0.06,
                                child: TextField(
                                    readOnly: true,
                                    onTap: () {
                                      onSearchTap!();
                                    },
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.search,
                                          color: ColorConstants.color_0xff707070,
                                        ),
                                        contentPadding: const EdgeInsets.only(bottom: 0, left: 12),
                                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                        hintText: searchHintText,
                                        border: InputBorder.none,
                                        alignLabelWithHint: true))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              hasButton!
                  ? Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            buttonTab!();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              color: ColorConstants.color_0xff1A5AD9,
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 50,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(12),
                              child: CustomText(
                                shouldFit: false,
                                title: buttonText,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container()
            ]),
          ),
        ],
      ),
    );
  }
}

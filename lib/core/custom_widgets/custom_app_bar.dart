import 'dart:io';

import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_text.dart';

enum LeadingAction { CHANGEACCOUNT, BACK, NONE, CLOSE }
enum AppBarBackgroundType { IMAGE, MODAL, NONE }

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? leadingActionTap;
  final Color? backgroundColor;
  final Color? firstTextColor;
  final Color? coloredfirstTextColor;
  final Color? avatarColor;
  final Color? secondeTextColor;
  final Color? iconColor;
  final bool? isToLined;
  final String? coloresfirstText;
  final String? firstText;
  final bool? hasBackIcon;
  final String? secondeText;

  BaseAppBar(
      {this.backgroundColor = ColorConstants.color_0xff1A5AD9,
      this.isToLined = false,
      this.firstText,
      this.secondeText,
      this.firstTextColor,
      this.secondeTextColor,
      this.coloresfirstText,
      this.coloredfirstTextColor,
      this.hasBackIcon = true,
      this.iconColor,
      this.avatarColor,
      this.leadingActionTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 350,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            hasBackIcon!
                ? InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      leadingActionTap!();
                    },
                    child: CircleAvatar(
                        child: Icon(
                          Icons.arrow_back,
                          color: iconColor,
                        ),
                        backgroundColor: avatarColor),
                  )
                : Container(),
            SizedBox(
              width: hasBackIcon! ? 10 : 0,
            ),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                isToLined!
                    ? RichText(
                        text: TextSpan(
                            text: coloresfirstText != null ? coloresfirstText : "",
                            style: TextStyle(color: coloredfirstTextColor, fontSize: 12, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: firstText != null ? firstText : "",
                                style: TextStyle(color: firstTextColor, fontSize: 12, fontWeight: FontWeight.normal),
                              )
                            ]),
                      )
                    : Container(),
                CustomText(
                  shouldFit: true,
                  title: secondeText,
                  style: TextStyle(color: secondeTextColor, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ],
        ),
      ),
      backgroundColor: ColorConstants.color_0xffffffff,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Platform.isAndroid ? 75 : 150);
}

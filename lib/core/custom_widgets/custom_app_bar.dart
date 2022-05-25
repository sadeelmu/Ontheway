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
  final bool? hasCircularBorder;
  final Widget? additionalWidget;
  final double? toolbarHeight;

  BaseAppBar(
      {Key? key,
      this.backgroundColor = ColorConstants.color_0xffffffff,
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
      this.toolbarHeight = 350,
      this.leadingActionTap,
      this.hasCircularBorder = false,
      this.additionalWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        shape: hasCircularBorder!
            ? RoundedRectangleBorder(
                borderRadius: new BorderRadius.vertical(
                bottom: new Radius.elliptical(
                    MediaQuery.of(context).size.width, 90.0),
              ))
            : Border.all(width: 0, color: backgroundColor!),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: toolbarHeight,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isToLined!
                              ? RichText(
                                  text: TextSpan(
                                      text: coloresfirstText != null
                                          ? coloresfirstText
                                          : "",
                                      style: TextStyle(
                                          color: coloredfirstTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: firstText != null
                                              ? firstText
                                              : "",
                                          style: TextStyle(
                                              color: firstTextColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        )
                                      ]),
                                )
                              : Container(),
                          CustomText(
                            shouldFit: true,
                            title: secondeText,
                            style: TextStyle(
                                color: secondeTextColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ],
              ),
              additionalWidget != null
                  ? SizedBox(
                      height: 20,
                    )
                  : Container(),
              additionalWidget != null ? additionalWidget! : Container(),
            ],
          ),
        ),
        backgroundColor: backgroundColor);
  }

  @override
  Size get preferredSize => Size.fromHeight(175);
}

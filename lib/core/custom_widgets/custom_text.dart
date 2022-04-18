import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? title;
  final TextStyle? style;
  final int maxLins;
  final TextOverflow textOverflow;
  final TextAlign textAlign;
  final bool shouldFit;
  final bool shouldBeCapitalized;

  CustomText({
    @required this.title,
    @required this.style,
    this.maxLins = 1,
    this.textOverflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.shouldFit = true,
    this.shouldBeCapitalized = false,
  });

  @override
  Widget build(BuildContext context) {
    return shouldFit
        ? FittedBox(
            fit: BoxFit.contain,
            child: Text(
              shouldBeCapitalized ? title?.toUpperCase() ?? "" : title ?? "",
              maxLines: maxLins,
              overflow: textOverflow,
              textAlign: textAlign,
              style: style,
            ))
        : Wrap(
            children: <Widget>[
              Text(
                shouldBeCapitalized ? title?.toUpperCase() ?? "" : title ?? "",
                maxLines: maxLins,
                overflow: textOverflow,
                textAlign: textAlign,
                style: style,
              )
            ],
          );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterweekend/constants/app_colors.dart';

class Titled extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final TextStyle? titleTextStyle;
  final Widget? child;

  const Titled({Key? key, this.title, this.titleColor, this.titleTextStyle, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (title != null)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10), //, vertical: 5),
            child: Text(
              title!,
              style: titleTextStyle ?? TextStyle(color: titleColor ?? kGrey2, fontSize: 12),
            ),
          ),
        if (title != null) SizedBox(height: 5),
        child!
      ],
    );
  }
}

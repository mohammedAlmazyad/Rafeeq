import 'package:flutter/material.dart';
import 'package:flutterweekend/constants/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final Color buttonColor;
  final String title;
  final double titleSize;
  final Color titleColor;
  final Color borderColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final double height;
  final void Function() onTap;

  RoundedButton({
    this.buttonColor,
    @required this.title,
    this.titleColor = Colors.white,
    @required this.onTap,
    this.padding,
    this.titleSize,
    this.borderRadius,
    this.borderColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? kCardHeight,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10),
        padding: padding ?? EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? kBorderRadiusSmall,
          color: borderColor == null ? buttonColor ?? kPrimaryColor : kTransparent,
          border: borderColor != null ? Border.all(color: borderColor, width: 2) : null,
        ),
        child: Text(title,
            style:
                TextStyle(fontSize: titleSize ?? 16, fontWeight: FontWeight.w500, color: titleColor ?? kPrimaryColor)),
      ),
    );
  }
}

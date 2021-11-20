import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  const ActionButton({required this.title, this.onTap, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: kBorderRadiusSmall,
        color: kGrey5,
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 12, color: kGrey1, fontWeight: FontWeight.w600),
      ),
    );
  }
}

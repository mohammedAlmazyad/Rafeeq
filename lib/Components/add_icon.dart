import 'package:flutter/material.dart';
import 'package:flutterweekend/constants/app_colors.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: kGrey5, borderRadius: kBorderRadiusSmall),
      child: Icon(Icons.add, color: kGrey),
    );
  }
}

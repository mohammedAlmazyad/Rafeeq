import 'package:flutter/material.dart';
import 'package:flutterweekend/Components/add_icon.dart';
import 'package:flutterweekend/constants/app_colors.dart';

class AddButton extends StatelessWidget {
  final Function onTap;

  const AddButton({@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(borderRadius: kBorderRadius, border: Border.all(color: kPrimaryColor, width: 1)),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          AddIcon(),
          SizedBox(height: 10),
          Text('add', style: TextStyle(fontSize: 10, color: kwhite)),
        ],
      ),
    );
  }
}

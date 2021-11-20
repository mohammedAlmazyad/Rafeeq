import 'package:flutter/material.dart';
import 'package:flutterweekend/constants/app_colors.dart';
import '../components/rounded_button.dart';
import '../Components/animations/bottom_slide_transitions.dart';

class AlertDialogBox {
  static Future<void> showAlert(String _message, context, {bool locale = false, String title = ''}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return BottomSlideTransition(
          child: AlertDialog(
            title: Text(
              title,
              // style: kMidTitleTextStyle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kDark2,
              ),
              textAlign: TextAlign.center,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: kLight3,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  if (title.isEmpty) SizedBox(height: 5),
                  Center(
                    child: Text(
                      _message,
                      // style: kLabelTextStyle,
                      style: kAlertTS,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: RoundedButton(
                      buttonColor: kPrimaryColor,
                      title: 'ok',
                      titleColor: Colors.white,
                      onTap: () => Navigator.pop(context),
                      height: kCardHeight - 10,
                      padding: EdgeInsets.zero,
                      titleSize: 14,
                      borderColor: kTransparent,
                      borderRadius: kBorderRadius,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../components/action_button.dart';
import '../components/rounded_button.dart';
import '../constants/app_colors.dart';

modalBottomSheet(context, {@required Widget child, @required String title, bool locale = false}) {
  showModalBottomSheet(
    isScrollControlled: true,
    elevation: 0,
    useRootNavigator: true,
    // enableDrag: false,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => SingleChildScrollView(
      // reverse: true,
      //TODO: to fix the end of list problem
      // physics: ClampingScrollPhysics(),
      child: Container(
        decoration:
            const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(10)), color: kBackground),
        margin: EdgeInsets.only(top: kToolbarHeight + 10, bottom: MediaQuery.of(context).viewInsets.bottom),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: (title == null) ? 20 : kToolbarHeight + 40),
                  Hero(
                    tag: 'bottomSheet',
                    child: child,
                  ),
                  // if (title != null) SizedBox(height: 100),
                  // if (title == null)
                  RoundedButton(
                    title: 'cancel',
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: kLight4, blurRadius: 5, offset: Offset(0, 10))],
                color: kLight4,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 5,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: kLight0,
                        borderRadius: kBorderRadius,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(title, style: kSubTitle),
                      // top cancel button
                      ActionButton(
                        title: 'cancel',
                        onTap: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterweekend/Components/add_burron.dart';
import 'package:flutterweekend/Components/alert_dialog.dart';
import 'package:flutterweekend/model/task.dart';
import 'package:flutterweekend/services/fire_base.dart';
// import 'package:image_picker/image_picker.dart';
import 'Components/rounded_button.dart';
import 'Components/rounded_text_field.dart';
import 'Components/titled.dart';
import 'constants/app_colors.dart';
import 'dart:math';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddTaskScreen> {
  List<Widget> displayImages = [];
  List<File> imageFile;
  bool havePrice = false;
  final db = FirestoreService();

  @override
  void initState() {
    super.initState();
    // displayImages.add(AddButton(onTap: () async {
    //   print('dsfsd');
    //   return addDisplayImages();
    // }));
  }

  // Future<void> addDisplayImages() async {
  //   print('dssdf');
  //   late PickedFile pickedImage;

  //   pickedImage = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedImage != null) {
  //     imageFile.add(File(pickedImage.path));
  //   }

  //   // await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 30).catchError(
  //   //   (onError) async {
  //   //     AlertDialogBox.showAlert("giveAppPermeation", context, locale: true);
  //   //   },
  //   // );

  //   if (pickedImage != null) {
  //     File image = File(pickedImage.path);
  //     imageFile.add(image);
  //     displayImages.add(
  //       Stack(
  //         alignment: Alignment.topRight,
  //         children: [
  //           Container(
  //             height: 100,
  //             width: 100,
  //             margin: const EdgeInsets.all(10),
  //             decoration: BoxDecoration(
  //               borderRadius: kBorderRadius,
  //               boxShadow: kBoxShadow,
  //               border: Border.all(color: kGrey5),
  //               image: DecorationImage(image: FileImage(image), fit: BoxFit.fill),
  //             ),
  //           ),
  //           InkWell(
  //             onTap: () => setState(() {
  //               displayImages.removeAt(displayImages.length - 1);
  //               imageFile.removeAt(displayImages.length - 1);
  //             }),
  //             child: const Icon(Icons.remove_circle, color: kRed),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  //   //Max number of images
  //   if (displayImages.length > 1) {
  //     displayImages.removeAt(1);
  //     imageFile.removeAt(0);
  //   }

  //   setState(() {});
  //   return;
  // }
  String taskName;
  String taskDis;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Titled(
              title: 'name',
              child: RoundedTextField(
                maxLines: 1,
                maxLength: 40,
                hint: 'productName',
                fillColor: kGrey5,
                onChanged: (String value) {
                  taskName = value;
                  print(taskName);
                },
              ),
            ),
            // ElevatedButton(
            //   child: Text("Add image"),
            //   onPressed: () {
            //     // addDisplayImages();
            //     ImagePicker().getImage(source: ImageSource.camera);
            //   },
            // ),
            const SizedBox(height: 10),
            // displayImages
            Titled(
                title: 'displayImages',
                child: Container(
                  // alignment: customAlignment(context),
                  decoration: const BoxDecoration(borderRadius: kBorderRadius),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: displayImages,
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            //description

            RoundedTextField(
              title: 'description',
              height: 200,
              maxLines: 100,
              maxLength: 350,
              clearButton: false,
              keyboardType: TextInputType.multiline,
              onChanged: (String value) {
                taskDis = value;
                print(taskDis);
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        RoundedButton(
          title: 'add',
          onTap: () {
            Random random = new Random();
            int randomNumber = random.nextInt(1000);
            Task newTask = Task(
                taskName: taskName,
                taskStatus: 0,
                timeAdded: DateTime.now().toString(),
                userId: '12',
                imageURL:
                    'data:image/jpeg;base64,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',
                taskDescription: taskDis,
                userName: 'mohammed',
                taskId: randomNumber.toString());
            db.addTask(newTask);

            Navigator.pop(context);
          },
        ),
        // StreamBuilder<bool>(
        //     stream: productBloc.isValid,
        //     builder: (context, snapshot) {
        //       return StreamBuilder<AppUser>(
        //           stream: authBloc.user,
        //           builder: (context, user) {
        //             // if (!user.hasData) return Container();
        //             return RoundedButton(
        //               buttonColor:
        //                   (snapshot.data == true && imageFile.length > 0 && user.hasData) ? null : Colors.grey,
        //               title: 'done',
        //               onTap: () async {
        //                 if (snapshot.data == true &&
        //                     imageFile.length > 0 &&
        //                     user.hasData &&
        //                     authBloc.didValidateEmail()) {
        //                   Progress.ProgressDialog pr = Progress.ProgressDialog(context);
        //                   pr.show();
        //                   productBloc.changeUserName(user.data.username);
        //                   productBloc.changeUserAvatar(user.data.avatarUrl);
        //                   productBloc.changeUniName(user.data.universityName);
        //                   await productBloc.pickImage(imageFile);
        //                   await productBloc
        //                       .saveProduct()
        //                       .then((value) => Navigator.pop(context))
        //                       .then((value) => pr.hide());
        //                 } else if (!user.hasData) {
        //                   if (await AlertDialogBox.showAssertionDialog('you must signin or signup  first', context,
        //                       continueButton: getText(context, 'login')))
        //                     Navigator.pushNamed(context, 'SignUpScreen');
        //                   // AppAlerts.showErrorDialog(
        //                   //     Platform.isIOS, context, 'you must signin or signup  first', 'Error');
        //                 } else if (!authBloc.didValidateEmail()) {
        //                   if (await AlertDialogBox.showAssertionDialog('You need to verify your email first', context,
        //                       continueButton: getText(context, 'Resend verification email')))
        //                     authBloc.resendSendVerificationEmail();

        //                   // AlertDialogBox.showAlert('go varifier your email', context);

        //                   // AppAlerts.showErrorDialog(Platform.isIOS, context, 'go varifier your email', 'Error');
        //                 } else if (imageFile.length <= 0) {
        //                   AlertDialogBox.showAlert(' Please add a photo', context);
        //                 } else {
        //                   AlertDialogBox.showAlert(
        //                       'make sure that the name is more then 3 letters and the description is longer then 10',
        //                       context);
        //                   // AppAlerts.showErrorDialog(Platform.isIOS, context,
        //                   //     'make sure that the name is more then 3 letters and the description is longer then 10', 'Error');
        //                 }
        //               },
        //             );
        //           });
        //     })
      ],
    );
  }
}

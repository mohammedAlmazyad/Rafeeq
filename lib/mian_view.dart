import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweekend/constants/app_colors.dart';
import 'package:flutterweekend/model/task.dart';
import 'package:flutterweekend/services/fire_base.dart';

import 'Components/modal_bottom_sheet.dart';
import 'Components/task_card.dart';
import 'add_task_screen.dart';

class MainView extends StatelessWidget {
  MainView({
    Key key,
  }) : super(key: key);
  final db = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Done Tasks',
          style: kTitle,
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                borderRadius: kBorderRadius,
                boxShadow: kBoxShadow,
                color: kPrimaryColor,
              ),
              // height: 40.0,
              width: 240.0,
              // ignore: use_full_hex_values_for_flutter_colors
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Add mentow',
                    style: kSubTitle,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    CupertinoIcons.person_add,
                    color: kwhite,
                  )
                ],
              ),
              // alignment:
            ),
          ),
          FutureBuilder<List<Task>>(
              future: db.fetchtasks(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Expanded(child: TaskCard(task: snapshot.data[index]));
                    },
                  );
                } else {
                  return Expanded(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Text(
                        'no items',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                elevation: 10,
                child: Icon(Icons.add),
                onPressed: () async {
                  // ignore: void_checks
                  await modalBottomSheet(
                    context,
                    child: AddTaskScreen(),
                    title: 'Add Task',
                  );
                },
                backgroundColor: kPrimaryColor,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Add New Task',
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(kalzheimerIcon),
            enableFeedback: false,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterweekend/constants/app_colors.dart';

import 'package:flutterweekend/mian_view.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: kPrimaryColor, splashColor: kTransparent),
      home: MainView(),
    );
  }
}




// class Home extends ConsumerWidget {
//   // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final String value = ref.watch(helloWorldProvider);

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           iconTheme: const IconThemeData(color: Colors.black),
//           title: const Text(
//             'Done Tasks',
//             style: TextStyle(color: Colors.black),
//           ),
//         ),
//         body: Column(
//           children: [
//             Container(
//               height: 40.0,
//               width: 240.0,
//               // ignore: use_full_hex_values_for_flutter_colors
//               color: const Color(0xfff99a799),
//               child: Center(
//                   child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [Text('Add mentow'), Icon(Icons.add)],
//               )),
//               // alignment:
//             ),
//             Expanded(
//               child: ListView(
//                 children: [
//                   TaskCard(
//                     task: Task(
//                         taskName: 'taskName',
//                         taskStatus: 0,
//                         timeAdded: 'timeAdded',
//                         userId: 'userId',
//                         imageURL:
//                             'https://images.ctfassets.net/hrltx12pl8hq/4plHDVeTkWuFMihxQnzBSb/aea2f06d675c3d710d095306e377382f/shutterstock_554314555_copy.jpg',
//                         taskDescription: 'taskDescription',
//                         userName: 'userName',
//                         taskId: 'taskId'),
//                   ),
//                   TaskCard(
//                       task: Task(
//                           taskName: 'taskName',
//                           taskStatus: 0,
//                           timeAdded: 'timeAdded',
//                           userId: 'userId',
//                           imageURL:
//                               'https://images.ctfassets.net/hrltx12pl8hq/4plHDVeTkWuFMihxQnzBSb/aea2f06d675c3d710d095306e377382f/shutterstock_554314555_copy.jpg',
//                           taskDescription: 'taskDescription',
//                           userName: 'userName',
//                           taskId: 'taskId')),
//                   TaskCard(
//                       task: Task(
//                           taskName: 'taskName',
//                           taskStatus: 0,
//                           timeAdded: 'timeAdded',
//                           userId: 'userId',
//                           imageURL:
//                               'https://images.ctfassets.net/hrltx12pl8hq/4plHDVeTkWuFMihxQnzBSb/aea2f06d675c3d710d095306e377382f/shutterstock_554314555_copy.jpg',
//                           taskDescription: 'taskDescription',
//                           userName: 'userName',
//                           taskId: 'taskId')),
//                   TaskCard(
//                       task: Task(
//                           taskName: 'taskName',
//                           taskStatus: 0,
//                           timeAdded: 'timeAdded',
//                           userId: 'userId',
//                           imageURL:
//                               'https://images.ctfassets.net/hrltx12pl8hq/4plHDVeTkWuFMihxQnzBSb/aea2f06d675c3d710d095306e377382f/shutterstock_554314555_copy.jpg',
//                           taskDescription: 'taskDescription',
//                           userName: 'userName',
//                           taskId: 'taskId')),
//                   TaskCard(
//                       task: Task(
//                           taskName: 'taskName',
//                           taskStatus: 0,
//                           timeAdded: 'timeAdded',
//                           userId: 'userId',
//                           imageURL:
//                               'https://images.ctfassets.net/hrltx12pl8hq/4plHDVeTkWuFMihxQnzBSb/aea2f06d675c3d710d095306e377382f/shutterstock_554314555_copy.jpg',
//                           taskDescription: 'taskDescription',
//                           userName: 'userName',
//                           taskId: 'taskId')),
//                   TaskCard(
//                       task: Task(
//                           taskName: 'taskName',
//                           taskStatus: 0,
//                           timeAdded: 'timeAdded',
//                           userId: 'userId',
//                           imageURL:
//                               'https://images.ctfassets.net/hrltx12pl8hq/4plHDVeTkWuFMihxQnzBSb/aea2f06d675c3d710d095306e377382f/shutterstock_554314555_copy.jpg',
//                           taskDescription: 'taskDescription',
//                           userName: 'userName',
//                           taskId: 'taskId')),
//                   TaskCard(
//                       task: Task(
//                           taskName: 'taskName',
//                           taskStatus: 0,
//                           timeAdded: 'timeAdded',
//                           userId: 'userId',
//                           imageURL:
//                               'https://images.ctfassets.net/hrltx12pl8hq/4plHDVeTkWuFMihxQnzBSb/aea2f06d675c3d710d095306e377382f/shutterstock_554314555_copy.jpg',
//                           taskDescription: 'taskDescription',
//                           userName: 'userName',
//                           taskId: 'taskId')),
//                   TaskCard(
//                       task: Task(
//                           taskName: 'taskName',
//                           taskStatus: 0,
//                           timeAdded: 'timeAdded',
//                           userId: 'userId',
//                           imageURL:
//                               'https://images.ctfassets.net/hrltx12pl8hq/4plHDVeTkWuFMihxQnzBSb/aea2f06d675c3d710d095306e377382f/shutterstock_554314555_copy.jpg',
//                           taskDescription: 'taskDescription',
//                           userName: 'userName',
//                           taskId: 'taskId')),
//                   TaskCard(
//                       task: Task(
//                           taskName: 'taskName',
//                           taskStatus: 0,
//                           timeAdded: 'timeAdded',
//                           userId: 'userId',
//                           imageURL:
//                               'https://images.ctfassets.net/hrltx12pl8hq/4plHDVeTkWuFMihxQnzBSb/aea2f06d675c3d710d095306e377382f/shutterstock_554314555_copy.jpg',
//                           taskDescription: 'taskDescription',
//                           userName: 'userName',
//                           taskId: 'taskId')),
//                   TaskCard(
//                       task: Task(
//                           taskName: 'taskName',
//                           taskStatus: 0,
//                           timeAdded: 'timeAdded',
//                           userId: 'userId',
//                           imageURL:
//                               'https://images.ctfassets.net/hrltx12pl8hq/4plHDVeTkWuFMihxQnzBSb/aea2f06d675c3d710d095306e377382f/shutterstock_554314555_copy.jpg',
//                           taskDescription: 'taskDescription',
//                           userName: 'userName',
//                           taskId: 'taskId')),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 FloatingActionButton(
//                   child: Icon(Icons.add),
//                   onPressed: () async {
//                     // ignore: void_checks
//                     await modalBottomSheet(
//                       context,
//                       child: AddTaskScreen(),
//                       title: 'Add Task',
//                     );
//                   },
//                   backgroundColor: Color(0xfff99a799),
//                 ),
//                 const Text(
//                   'Add New Task',
//                   style: TextStyle(
//                     color: Color(0xfff99a799),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// // modalBottomSheet(context) {
// //   showModalBottomSheet(
// //       isScrollControlled: true,
// //       builder: (BuildContext context) {
// //         return Column(
// //           children: [
// //             Container(
// //               child: Text('jfnkj'),
// //               height: 10,
// //             ),
// //           ],
// //         );
// //       },
// //       context: context);
// // }

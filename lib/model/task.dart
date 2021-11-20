import 'package:flutter/foundation.dart';

class Task {
  final String taskId;
  final String taskName;
  final int taskStatus;
  final String timeAdded;
  final String userId;
  final String imageURL;
  final String taskDescription;
  final String userName;

  Task({
    required this.taskName,
    required this.taskStatus,
    required this.timeAdded,
    required this.userId,
    required this.imageURL,
    required this.taskDescription,
    required this.userName,
    required this.taskId,
  });

  Map<String, dynamic> toMap() {
    return {
      'taskName': taskName,
      'taskStatus': taskStatus,
      'imageURL': imageURL,
      'userName': userName,
      'userId': userId,
      'timeAdded': timeAdded,
      'taskDescription': taskDescription,
      'taskId': taskId,
    };
  }

  Task.fromFirestore(
    Map<String, dynamic> firestore,
  )   : userName = firestore['userName'],
        userId = firestore['userId'],
        timeAdded = firestore['timeAdded'],
        taskName = firestore['taskName'],
        taskId = firestore['taskId'],
        taskStatus = firestore['taskStatus'],
        imageURL = firestore['imageURL'],
        taskDescription = firestore['taskDescription'];

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(StringProperty('userId', userId));
  //   properties.add(StringProperty('userId', userId));
  //   properties.add(StringProperty('userId', userId));
  // }
}

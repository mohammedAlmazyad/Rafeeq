import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterweekend/model/task.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  var opations = SetOptions(merge: true);

  // ----------------------------- user -----------------------------

  //----------------------------- tasks -----------------------------

  Future<void> deleteTask(String prouductId) {
    return _db.collection('tasks').doc(prouductId).update({'taskStatus': 2});
  }

  Future<List<Task>> fetchtasks() async {
    var doc =
        await _db.collection('tasks').orderBy('timeAdded', descending: true).where('taskStatus', isEqualTo: 1).get();
    return doc.docs.map((snapshot) => Task.fromFirestore(snapshot.data())).toList();
  }

  Future<void> addTask(Task task) {
    return _db.collection('Tasks').doc(task.taskId).set(task.toMap(), opations);
  }

  Future<Task> fetchTask(String taskId) {
    return _db.collection('tasks').doc(taskId).get().then((snapshot) => Task.fromFirestore(snapshot.data()));
  }

  //----------------------------- comments -----------------------------

}

import 'package:cloud_firestore/cloud_firestore.dart';

class Tasks {
  final String? taskId;
  final String? latitude;
  final String? longitude;
  final String? wid;
  final String? uid;
  final String? taskType;
  final String? trashSize;

  Tasks(
      {this.taskId,
      this.latitude,
      this.longitude,
      this.wid,
      this.taskType,
      this.trashSize,
      this.uid});

  static Tasks fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Tasks(
        uid: snapshot['uid'],
        wid: snapshot['wid'],
        latitude: snapshot['latitude'],
        longitude: snapshot['longitude'],
        trashSize: snapshot['trashSize'],
        taskType: snapshot['taskType'],
        taskId: snapshot['taskId'],
        );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'wid':wid,
        'latitude': latitude,
        'longitude': longitude,
        'trashSize': trashSize,
        'taskType': taskType,
        'taskId': taskId,
      };
}

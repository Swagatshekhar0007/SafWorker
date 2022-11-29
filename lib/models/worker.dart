import 'package:cloud_firestore/cloud_firestore.dart';

class Worker {
  final String email;
  final String uid;
  final String userName;

  const Worker({
    required this.email,
    required this.uid,
    required this.userName,
  });

  Map<String, dynamic> toJson() =>
    {'username': userName, 'uid': uid, 'email': email};

  static Worker fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Worker(
      userName: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
    );
  }
}
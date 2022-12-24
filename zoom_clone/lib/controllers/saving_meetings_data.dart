import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class MeetingsData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream get getMeetingStreem =>
      _firestore.collection('users').doc(_auth.currentUser!.uid).snapshots();
  saveMeetingData(String roomName) async {
    try {
      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        'roomName': roomName,
        'CreatedAt': DateTime.now(),
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

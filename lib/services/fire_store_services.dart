import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreServicesx {
  static var uid = FirebaseAuth.instance.currentUser!.uid;
  var posts = FirebaseFirestore.instance;

  Future<void> getposts() async {
    try {
      log(posts.doc(uid).collection('Posts').toString());
    } catch (e) {}
  }
}

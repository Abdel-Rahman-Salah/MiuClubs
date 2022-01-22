import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginsignup/models/club.dart';

class FireStoreServicesx {
  static var uid = FirebaseAuth.instance.currentUser!.uid;
  var posts = FirebaseFirestore.instance.collection('Posts');

  Future<void> getposts() async {
    try {
      log(posts.doc(uid).collection('Posts').toString());
    } catch (e) {}
  }

  CollectionReference clubsCollection =
      FirebaseFirestore.instance.collection('Clubs');

  Future<List> getClubs() async {
    QuerySnapshot querySnapshot = await clubsCollection.get();

    final data = querySnapshot.docs.map((doc) => doc.data()).toList();

    log('$data');
    return data;
  }

  static saveClub(Club club) async {
    return FirebaseFirestore.instance
        .collection('clubs')
        .doc(club.clubId)
        .set(club.toMap());
  }
}

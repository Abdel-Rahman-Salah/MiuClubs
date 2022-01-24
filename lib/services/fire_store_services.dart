import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginsignup/models/club.dart';
import 'package:loginsignup/models/post.dart';
import '../models/event.dart';

class FireStoreServicesx {
  static var uid = FirebaseAuth.instance.currentUser!.uid;
  var posts = FirebaseFirestore.instance;

  Future<void> getposts() async {
    try {
      log(posts.doc(uid).collection('Posts').toString());
    } catch (e) {}
  }

  CollectionReference clubsCollection =
      FirebaseFirestore.instance.collection('clubs');

  Future<List> getClubs() async {
    QuerySnapshot querySnapshot = await clubsCollection.get();

    final data = querySnapshot.docs.map((doc) => doc.data()).toList();

    log('$data');
    return data;
  }

  Stream<List<Club>> getClubRequests() {
    return FirebaseFirestore.instance
        .collection('club_requests')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => Club.RequestsfromFirestore(document.data()))
            .toList());
  }

  static removeRequestClub(String clubId) async {
    return FirebaseFirestore.instance
        .collection('club_requests')
        .doc(clubId)
        .delete();
  }

  static removeClub(String clubId) async {
    return FirebaseFirestore.instance.collection('clubs').doc(clubId).delete();
  }

  static requestClub(Club club) async {
    return FirebaseFirestore.instance
        .collection('club_requests')
        .doc(club.clubId)
        .set(club.reqtoMap());
  }

  Stream<List<Club>> getClub() {
    return FirebaseFirestore.instance.collection('clubs').snapshots().map(
        (snapshot) => snapshot.docs
            .map((document) => Club.fromFirestore(document.data()))
            .toList());
  }

  Stream get allClubs =>
      FirebaseFirestore.instance.collection("clubs").snapshots();

  static saveClub(Club club) async {
    return FirebaseFirestore.instance
        .collection('clubs')
        .doc(club.clubId)
        .set(club.toMap());
  }

  static savePost(Post post) async {
    return FirebaseFirestore.instance
        .collection('Posts')
        .doc(post.postId)
        .set(post.toMap());
  }

//Events
  CollectionReference eventsCollection =
      FirebaseFirestore.instance.collection('events');

  Future<List> getEvents() async {
    QuerySnapshot querySnapshot = await eventsCollection.get();

    final data = querySnapshot.docs.map((doc) => doc.data()).toList();

    log('$data');
    return data;
  }

  Stream<List<Club>> getEvent() {
    return FirebaseFirestore.instance.collection('events').snapshots().map(
        (snapshot) => snapshot.docs
            .map((document) => Club.fromFirestore(document.data()))
            .toList());
  }

  Stream get allEvents =>
      FirebaseFirestore.instance.collection("events").snapshots();

  static saveEvent(Event event) async {
    return FirebaseFirestore.instance
        .collection('events')
        .doc(event.eventId)
        .set(event.toMap());
  }
}

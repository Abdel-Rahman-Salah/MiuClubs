import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/layout/constant.dart';
import 'package:loginsignup/layout/imports.dart';
import 'package:loginsignup/layout/imports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';

class notifilist extends StatefulWidget {
  @override
  State<notifilist> createState() => _notifilistState();
}

class _notifilistState extends State<notifilist> {
  final FirebaseMessaging _firebasemessaging = FirebaseMessaging.instance;
  final List<note> notes = [];
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message datax: ${message.data['header']}');
      setState(() {
        notes.add(note(message.data['header'], message.data['body']));
      });
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    Future<void> _firebaseMessagingBackgroundHandler(
        RemoteMessage message) async {
      await Firebase.initializeApp();
      print('Handling a background message ${message.messageId}');
    }

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    Future<NotificationSettings> reqperms() async {
      NotificationSettings settings = await _firebasemessaging
          .requestPermission(sound: true, badge: true, alert: true);
      print('permisiion: ${settings.authorizationStatus}');
      return settings;
    }

    Future<NotificationSettings> settings = reqperms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerwidget(),
      appBar: Appbarwidget('Notifications'),
      body: ListView(
          padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
          children: notes.map(buildmap).toList()),
    );
  }

  Widget buildmap(note note) => ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.red.shade200, width: 3)),
        title: Text(note.title),
        subtitle: Text(note.body),
        tileColor: Colors.grey[200],
      );
}

class note {
  final String title;
  final String body;

  const note(this.title, this.body);
}

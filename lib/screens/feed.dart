import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loginsignup/layout/imports.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Feed extends StatefulWidget {
  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  Stream<QuerySnapshot<Map<String, dynamic>>> firestore =
      FirebaseFirestore.instance.collection('Posts').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerwidget(),
      appBar: Appbarwidget('Feed'),
      bottomSheet: Footerwidget(),
      body: StreamBuilder(
          stream: firestore,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState != ConnectionState.active) {
              return Text(snapshot.connectionState.toString());
            }
            if (!snapshot.hasData) {
              return Text('${snapshot},........no data');
            }
            var Qdata = (snapshot.data! as QuerySnapshot);
            List<Post> posts = [];
            for (int i = 0; i < Qdata.docs.length; i++) {
              String titleR = Qdata.docs[i]['title'].toString();
              String descR = Qdata.docs[i]['description'].toString();
              posts.add(Post(titleR, 'post${i + 1}.png', descR));
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: posts,
                ),
              ),
            );
          }),
    );
  }
}

class Post extends StatelessWidget {
  String? title;
  String? image;
  String? description;
  Post(String title, String image, String description) {
    this.title = title;
    this.image = image;
    this.description = description;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 50,
                child: Row(
                  children: [
                    Text(
                      title!,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/' + image!,
                      fit: BoxFit.fitWidth,
                    ),
                    width: MediaQuery.of(context).size.width - 20,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Flexible(
                        child: Text(
                      description!,
                      style: TextStyle(fontSize: 15),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}

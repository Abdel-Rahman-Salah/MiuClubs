// ignore_for_file: file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/layout/imports.dart';
import 'package:loginsignup/layout/navigator.dart';
import 'package:loginsignup/providers/clubs_provider.dart';
import 'package:loginsignup/screens/add_club.dart';
import 'package:loginsignup/screens/manage_Clubs.dart';
import 'package:loginsignup/services/fire_store_services.dart';
import 'package:provider/provider.dart';
import '../models/club.dart';

class ClubRequests extends StatelessWidget {
  Widget _buildList(QuerySnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.docs.length,
        itemBuilder: (context, index) {
          final doc = snapshot.docs[index];
          String path = doc['logopath'];
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 64,
                    maxHeight: 64,
                  ),
                  // child: Image.asset(
                  //   'assets/images/$path',
                  //   fit: BoxFit.cover,
                  // ),
                  child: Image.network(path),
                ),
                trailing: Wrap(
                  spacing: 20,
                  children: [
                    IconButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("club_requests")
                              .doc(doc['clubId'])
                              .update({"status": 1});

                          FirebaseFirestore.instance
                              .collection("clubs")
                              .doc(doc['clubId'])
                              .set({
                            "clubId": doc['clubId'],
                            "name": doc['name'],
                            "description": doc['description'],
                            "owner": doc['owner'],
                            "mission": doc['mission'],
                            "vision": doc['vision'],
                            "logopath": doc['logopath'],
                            "president": doc['president']
                          });
                        },
                        icon: Icon(
                          Icons.check,
                          color: Colors.green[700],
                        )),
                    OutlinedButton(
                        onPressed: () {
                          Provider.of<ClubsProvider>(context, listen: false)
                              .removeRequests(doc['clubId']);
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.black,
                        )),
                  ],
                ),
                title: GestureDetector(
                  onTap: () {
                    // Toggle light when tapped.
                    print("whoop");
                  },
                  child: Text(
                    doc['name'],
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          title: const Text(
            'MIU CLUBS',
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.black,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('club_requests')
              .where('status', isEqualTo: 0)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Club Requests",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                ),
                Expanded(child: _buildList(snapshot.data!)),
              ],
            );
          }),
    );
  }
}

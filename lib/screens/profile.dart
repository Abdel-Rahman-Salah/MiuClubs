// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loginsignup/layout/constant.dart';
import 'package:loginsignup/layout/imports.dart';
import 'package:loginsignup/models/club.dart';
import 'package:provider/provider.dart';

class ClubProfile extends StatelessWidget {
  final index;
   ClubProfile({Key? key,required this.index}) : super(key: key);
  @override
   
  Widget build(BuildContext context) {
    // TODO: implement build
    final clubs = Provider.of<List<Club>>(context);
    
    final club=clubs[index];
    final name=club.name;
    final mission=club.mission;
    final vision =club.vision;
    final logo = club.logopath;
    log('Log is : $mission');
    
    return Scaffold(
      bottomSheet: Footerwidget(),
      drawer: Drawerwidget(),
      appBar: Appbarwidget('Profile'),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
             
               
                    Text(
                      "$name",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                        
                    ),
                    
               
             
             
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 150,
                                minHeight: 100,
                                maxWidth: 250,
                                maxHeight: 200,
                              ),
                              // child: Image.asset(
                              //   'assets/images/$path',
                              //   fit: BoxFit.cover,
                              // ),
                              child: Image.network(logo),
                            ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 12.5),
                child: Text(
                  "Mission",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "$mission",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 12.5),
                child: Text(
                  "Vision",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "$vision",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

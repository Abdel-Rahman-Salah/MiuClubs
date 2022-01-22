import 'package:flutter/material.dart';
import 'package:loginsignup/layout/imports.dart';

import '../layout/navigator.dart';

class AdminHomePage extends StatefulWidget {
  @override
  AdminHomePageState createState() => AdminHomePageState();
}

class AdminHomePageState extends State<AdminHomePage> {
  int currentPos = 0;
  List<String> listPaths = [
    "assets/images/default.png",
    "assets/images/login.jpg",
    "assets/images/owner.png",
    "assets/images/president.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'Dashboard',
              style: TextStyle(color: Colors.red),
            ),
            backgroundColor: Colors.black,
          ),
        ),
        drawer: Drawerwidget(),
        body: Column(
          children: [
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  //Card 1
                  Card(
                      color: Colors.red,
                      margin: EdgeInsets.only(
                          left: 10.0, right: 5.0, top: 20.0, bottom: 20.0),
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: EdgeInsets.only(top: 30.0),
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      Icons.add,
                                      size: 30,
                                    ),
                                    color: Colors.white,
                                    onPressed: () {
                                      MyNavigator.goToAddClub(context);
                                    }),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Text(
                                'Create Club',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      )),
                  // Card 2
                  Card(
                    color: Colors.black87,
                    margin: EdgeInsets.only(
                        left: 5.0, right: 10.0, top: 20.0, bottom: 20.0),
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                                flex: 8,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 30.0),
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        Icons.grid_view,
                                        size: 30,
                                      ),
                                      color: Colors.white,
                                      onPressed: () {
                                        print("hel");
                                      }),
                                )),
                            Flexible(
                              flex: 2,
                              child: Text(
                                'View Clubs',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )),
                  ),
                  //Card 3
                  Card(
                    //margin: EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 20.0),
                    color: Colors.black87,
                    margin: EdgeInsets.only(
                        left: 10.0, right: 5.0, top: 10.0, bottom: 20.0),
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 8,
                              child: Padding(
                                padding: EdgeInsets.only(top: 30.0),
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      Icons.edit,
                                      size: 30,
                                    ),
                                    color: Colors.white,
                                    onPressed: () {
                                      MyNavigator.goToManageClubs(context);
                                    }),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Text(
                                'Manage Clubs',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )),
                  ),
                  //Card 4
                  Card(
                    //   margin: EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 10.0),
                    margin: EdgeInsets.only(
                        left: 5.0, right: 10.0, top: 10.0, bottom: 20.0),
                    color: Colors.red,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                                flex: 8,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        Icons.add,
                                        size: 30,
                                      ),
                                      color: Colors.white,
                                      onPressed: () {
                                        MyNavigator.goclubrequest(context);
                                      }),
                                )),
                            Flexible(
                              flex: 2,
                              child: Text(
                                'View Club Requests',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

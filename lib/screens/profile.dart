import 'package:flutter/material.dart';
import 'package:loginsignup/layout/constant.dart';
import 'package:loginsignup/layout/imports.dart';

class ClubProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomSheet: Footerwidget(),
      drawer: Drawerwidget(),
      appBar: Appbarwidget('Profile'),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.25),
                child: Row(
                  children: [
                    Text(
                      "Club Full Slogan",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    IconButton(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.15),
                        onPressed: () {},
                        icon: Icon(Icons.settings))
                  ],
                ),
              ),
              Text(
                "Board",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(child: Image.asset('assets/images/owner.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Container(
                    child: Image.asset('assets/images/president.png')),
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
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
                  "Lorem ipsum dolor sit amet, consectetur lor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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

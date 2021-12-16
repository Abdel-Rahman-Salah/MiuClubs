import 'package:flutter/material.dart';
import 'package:loginsignup/feed.dart';
import 'package:loginsignup/screens/manage_Clubs.dart';
import 'package:loginsignup/signin/signin.dart';
import 'package:loginsignup/imports.dart';
import 'package:loginsignup/screens/splash_screen.dart';

import 'screens/add_Club.dart';
import 'screens/admin_homepage.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => Signin(),
  "/admin": (BuildContext context) => AdminHomePage(),
  "/create": (BuildContext context) => addClub(),
  "/manage": (BuildContext context) => ManageClubs(),
};

void main() => runApp(MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));

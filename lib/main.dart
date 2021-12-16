import 'package:flutter/material.dart';
import 'package:loginsignup/screens/feed.dart';
import 'package:loginsignup/screens/manage_clubs.dart';
import 'package:loginsignup/screens/signin.dart';
import 'package:loginsignup/screens/splash_screen.dart';

import 'screens/add_club.dart';
import 'screens/admin_homepage.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => Signin(),
  "/admin": (BuildContext context) => AdminHomePage(),
  "/create": (BuildContext context) => addClub(),
  "/manage": (BuildContext context) => ManageClubs(),
  "/feed": (BuildContext context) => Feed(),
};

void main() => runApp(MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));

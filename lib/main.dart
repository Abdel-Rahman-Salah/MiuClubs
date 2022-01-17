import 'package:flutter/material.dart';
import 'package:loginsignup/screens/feed.dart';
import 'package:loginsignup/screens/manage_clubs.dart';
import 'package:loginsignup/screens/signin.dart';
import 'package:loginsignup/screens/signin_admin.dart';
import 'package:loginsignup/screens/splash_screen.dart';

import 'screens/add_club.dart';
import 'screens/admin_homepage.dart';
import 'package:firebase_core/firebase_core.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => Signin(),
  "/admin": (BuildContext context) => AdminHomePage(),
  "/create": (BuildContext context) => addClub(),
  "/manage": (BuildContext context) => ManageClubs(),
  "/feed": (BuildContext context) => Feed(),
  "/adminlogin": (BuildContext context) => SigninAdmin(),
  "/profile": (BuildContext context) => Feed(),
};

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: routes));
}

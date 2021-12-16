import 'package:flutter/material.dart';
import 'package:loginsignup/screens/feed.dart';
import 'package:loginsignup/signin/signin.dart';
import 'package:loginsignup/screens/imports.dart';
import 'package:loginsignup/view/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => Feed(),
  "/feed": (BuildContext context) => Feed(),
};

void main() => runApp(MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));

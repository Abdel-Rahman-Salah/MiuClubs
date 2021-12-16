import 'package:flutter/material.dart';
import 'package:loginsignup/signin_old.dart';
import 'package:loginsignup/screens/feed.dart';
import 'package:loginsignup/screens/profile.dart';

class MyNavigator {
  static void GoLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }

  static void goToAdminHomepage(BuildContext context) {
    Navigator.pushNamed(context, "/admin");
  }

  static void goToAddClub(BuildContext context) {
    Navigator.pushNamed(context, "/create");
  }

  static void goToManageClubs(BuildContext context) {
    Navigator.pushNamed(context, "/manage");
  
  }
  
    static void gologin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  static void gofeed(BuildContext context) {
    Navigator.pushNamed(context, "/feed");
  }

  static void goprofile(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
}

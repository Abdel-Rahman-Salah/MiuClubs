import 'package:flutter/material.dart';
import 'package:loginsignup/others/signin_old.dart';
import 'package:loginsignup/screens/feed.dart';
import 'package:loginsignup/screens/profile.dart';

class MyNavigator {
  static void GoLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }

  static void GoLoginAdmin(BuildContext context) {
    Navigator.pushNamed(context, "/loginadmin");
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

  static void gofeed(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/feed");
  }

  static void goprofile(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, "/profile");
  }

  static void goTimeline(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, "/timeline");
  }

  static void goNotifications(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, "/notifications");
  }

  static void goloc(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, "/location_view");
  }

  static void goclubrequest(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, "/club_requests");
  }

  static void goPop(BuildContext context) {
    Navigator.pop(context);
  }
}

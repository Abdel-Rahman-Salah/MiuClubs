import 'package:flutter/material.dart';

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
}

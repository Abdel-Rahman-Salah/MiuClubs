import 'package:flutter/material.dart';
import 'package:loginsignup/constant.dart';
import 'package:loginsignup/imorts.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Profile(),
      );
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: Drawerwidget(),
        appBar: Appbarwidget('profile'),
        body: ListView(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.25),
          children: [
            Row(
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
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15),
              child: Text(
                "Board",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(child: Image.asset('assets/images/owner.png')),
          ],
        ));
  }
}

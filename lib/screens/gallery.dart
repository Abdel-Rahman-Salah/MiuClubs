import 'package:flutter/material.dart';
import 'package:loginsignup/layout/imports.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerwidget(),
      appBar: Appbarwidget('Gallery'),
      bottomSheet: Footerwidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(children:[
            Image.asset('images/lake.jpg'),
            Image.asset('images/lake.jpg'),
            Image.asset('images/lake.jpg'),
          ],),

           Row(children:[
            Image.asset('images/lake.jpg'),
            Image.asset('images/lake.jpg'),
            Image.asset('images/lake.jpg'),
          ],),

           Row(children:[
            Image.asset('images/lake.jpg'),
            Image.asset('images/lake.jpg'),
            Image.asset('images/lake.jpg'),
          ],),
        ],
      ),
    );
  }
}
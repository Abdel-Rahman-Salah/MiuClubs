import 'package:flutter/material.dart';
import 'package:loginsignup/imports.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerwidget(),
      appBar: Appbarwidget('Feed'),
      bottomSheet: Footerwidget(),
      body: Column(
        children: [Post('Egycon')],
      ),
    );
  }
}

/*class Post extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ;
  }
}*/

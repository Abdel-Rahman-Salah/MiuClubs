import 'package:flutter/material.dart';
import 'package:loginsignup/layout/imports.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerwidget(),
      appBar: Appbarwidget('Timeline'),
      bottomSheet: Footerwidget(),

      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Text(
                'Date',
              ),
              Image.asset('assets/images/tedx.png'),
            ],
          ),
          Row(
            children: [
              Text(
                'Date',
              ),
              Image.asset('assets/images/tedx.png'),
            ],
          ),
          Row(
            children: [
              Text(
                'Date',
              ),
              Image.asset('assets/images/tedx.png'),
            ],
          ),
        ],
      ),
    );
  }
}


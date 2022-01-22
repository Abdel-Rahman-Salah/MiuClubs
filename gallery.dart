import 'package:flutter/material.dart';
import 'package:loginsignup/layout/constant.dart';
import 'package:loginsignup/layout/imports.dart';

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var container = Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/images/e.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Image.asset(
                  'assets/images/e.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Image.asset(
                  'assets/images/e.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/images/mic.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Image.asset(
                  'assets/images/e.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Image.asset(
                  'assets/images/e.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/images/e.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Image.asset(
                  'assets/images/e.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Image.asset(
                  'assets/images/e.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gallery'),
        ),
        body: container);
  }
}

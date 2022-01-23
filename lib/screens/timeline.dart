import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Timeline extends StatelessWidget {
  const Timeline({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'MIU CLUBS',
              style: TextStyle(color: Colors.red),
            ),
            backgroundColor: Colors.black,
          ),
        ),
        body: Center(
          child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "23/1/2022",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        ),
                        Flexible(
                          child: Image.asset(
                            'assets/images/e.jpg',
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: (MediaQuery.of(context).size.width) / 2),
                            width: 1.5,
                            height: 100,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ])),
        ));
  }
}

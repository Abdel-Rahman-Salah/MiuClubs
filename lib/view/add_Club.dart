// ignore: file_names
import 'package:flutter/material.dart';

class addClub extends StatefulWidget {
  const addClub({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return addClubState();
  }
}

class addClubState extends State<addClub> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('text field: ${myController.text}');
  }
  //  @override
  //  void initState(){
  //    super.initState();
  //    myController.addListener(_printLatestValue);
  //  }

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
          padding: const EdgeInsets.fromLTRB(15.0, 50.0, 20.0, 15.0),
          width: 285,
          height: 750,
          decoration: new BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              SizedBox(
                height: 57,
                width: 650,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: null,
                      autofocus: false,
                      style: new TextStyle(
                          fontSize: 22.0, color: Color(0xFFbdc6cf)),
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Club Name',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ))),
                ),
              ),
              SizedBox(
                height: 57,
                width: 650,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: null,
                      autofocus: false,
                      style: new TextStyle(
                          fontSize: 22.0, color: Color(0xFFbdc6cf)),
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Club Owner',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ))),
                ),
              ),
              SizedBox(
                height: 57,
                width: 650,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: null,
                      autofocus: false,
                      style: new TextStyle(
                          fontSize: 22.0, color: Color(0xFFbdc6cf)),
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Club President',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ))),
                ),
              ),
              SizedBox(
                height: 57,
                width: 650,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: null,
                      autofocus: false,
                      style: new TextStyle(
                          fontSize: 22.0, color: Color(0xFFbdc6cf)),
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Club Description',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ))),
                ),
              ),
              SizedBox(
                height: 57,
                width: 650,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: null,
                      autofocus: false,
                      style: new TextStyle(
                          fontSize: 22.0, color: Color(0xFFbdc6cf)),
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Club Mission',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ))),
                ),
              ),
              SizedBox(
                height: 57,
                width: 650,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: null,
                      autofocus: false,
                      style: new TextStyle(
                          fontSize: 22.0, color: Color(0xFFbdc6cf)),
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Club Vision',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ))),
                ),
              ),
              SizedBox(
                height: 57,
                width: 650,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: null,
                      autofocus: false,
                      style: new TextStyle(
                          fontSize: 22.0, color: Color(0xFFbdc6cf)),
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Club Committees',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ))),
                ),
              ),
              SizedBox(
                height: 30,
                width: 450,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Colors.teal, width: 2.0)))),
                    child: Text('Create'),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}

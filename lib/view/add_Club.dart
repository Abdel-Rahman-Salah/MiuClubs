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
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        ),
                        color: Colors.red,
                        onPressed: () {}),
                    Container(height: 10, width: 24)
                  ],
                ),
              ),
              Text(
                'Create A Club',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 20, 20, 20),
            child: Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/default.png',
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.add_a_photo,
                          size: 20,
                        ),
                        color: Colors.white,
                        onPressed: () {}),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.grey),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: TextField(
                      controller: null,
                      autofocus: false,
                      style: new TextStyle(
                          fontSize: 12.0, color: Color(0xFFbdc6cf)),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: TextField(
                      controller: null,
                      autofocus: false,
                      style: new TextStyle(
                          fontSize: 12.0, color: Color(0xFFbdc6cf)),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: TextField(
                      controller: null,
                      autofocus: false,
                      style: new TextStyle(
                          fontSize: 12.0, color: Color(0xFFbdc6cf)),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: TextFormField(
                      controller: null,
                      autofocus: false,
                      maxLines: 7,
                      style: new TextStyle(
                          fontSize: 12.0, color: Color(0xFFbdc6cf)),
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Club Description',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 10.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: TextFormField(
                      controller: null,
                      autofocus: false,
                      maxLines: 7,
                      style: new TextStyle(
                          fontSize: 12.0, color: Color(0xFFbdc6cf)),
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Club Mission',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 10.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: TextFormField(
                      controller: null,
                      autofocus: false,
                      maxLines: 7,
                      style: new TextStyle(
                          fontSize: 12.0, color: Color(0xFFbdc6cf)),
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Club Vision',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 10.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: TextField(
                      controller: null,
                      autofocus: false,
                      maxLines: 3,
                      style: new TextStyle(
                          fontSize: 12.0, color: Color(0xFFbdc6cf)),
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
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      child: Text('Create'),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

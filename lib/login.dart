import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Login(),
      );
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomSheet: Container(
       width: 400,
          height: 50,
          decoration: new BoxDecoration(
              color: Colors.black,
              ),
       child: Padding(
         padding: const EdgeInsets.all(17.0),
         child: Text("CopyRights@",
         
         style: TextStyle(color: Colors.white),),
       )
      ),
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
          padding: const EdgeInsets.fromLTRB(15.0,50.0,20.0,15.0),
          width: 285,
          height: 350,
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
                      style:
                          new TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Username',
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
                      style:
                          new TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
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
                height: 75,
                width: 650,
                child: Padding(
                  padding: const EdgeInsets.only(top:40.0),
                  child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.teal, width: 2.0)))),
          child: Text('Login'),
          onPressed: () {},
        ),
                ),
              ),
            ],
          ),
        )));
  }
}

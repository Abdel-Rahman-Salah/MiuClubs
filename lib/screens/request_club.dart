// ignore: file_names
import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginsignup/layout/navigator.dart';
import 'package:loginsignup/providers/clubs_provider.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class requestClub extends StatefulWidget {
  const requestClub({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return requestClubState();
  }
}

class requestClubState extends State<requestClub> {
  final _formKey = GlobalKey<FormState>();

  final myController11 = TextEditingController();
  final myController12 = TextEditingController();
  final myController13 = TextEditingController();
  final myController14 = TextEditingController();
  final myController15 = TextEditingController();
  final myController16 = TextEditingController();

  File? _image;
  String txt = "";
  final picker = ImagePicker();
  @override
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.red),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.red,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.red,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.red,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String fileName = basename(_image!.path);
    Reference ref = storage.ref().child('uploads/$fileName');
    UploadTask uploadTask = ref.putFile(_image!);

    var downloadURL =
        (await (await uploadTask.whenComplete(() => ref.getDownloadURL()))
                .ref
                .getDownloadURL())
            .toString();
    return downloadURL;
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
              Container(height: 10, width: 24),
              Text(
                'Request A Club',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 20, 20, 10),
            child: Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: ClipOval(
                      child: _image == null
                          ? Image.asset(
                              'assets/images/default.png',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(_image!.path),
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
                        onPressed: () {
                          _showChoiceDialog(context);
                        }),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ],
              ),
            ),
          ),
          Text(
            txt,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Form(
                key: _formKey,
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
                        child: TextFormField(
                            controller: myController11,
                            autofocus: false,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter the club name';
                              return null;
                            },
                            onChanged: (value) {
                              Provider.of<ClubsProvider>(context, listen: false)
                                  .changeName(value);
                            },
                            style: new TextStyle(
                                fontSize: 12.0, color: Color(0xFFbdc6cf)),
                            decoration: new InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Club Name',
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                        child: TextFormField(
                            controller: myController12,
                            autofocus: false,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter the club Owner name';
                              return null;
                            },
                            onChanged: (value) {
                              Provider.of<ClubsProvider>(context, listen: false)
                                  .changeOwner(value);
                            },
                            style: new TextStyle(
                                fontSize: 12.0, color: Color(0xFFbdc6cf)),
                            decoration: new InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Club Owner',
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                        child: TextFormField(
                            controller: myController13,
                            autofocus: false,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter the club president name';
                              return null;
                            },
                            onChanged: (value) {
                              Provider.of<ClubsProvider>(context, listen: false)
                                  .changePresident(value);
                            },
                            style: new TextStyle(
                                fontSize: 12.0, color: Color(0xFFbdc6cf)),
                            decoration: new InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Club President',
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                        child: TextFormField(
                            controller: myController14,
                            autofocus: false,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter the club description';
                              return null;
                            },
                            onChanged: (value) {
                              Provider.of<ClubsProvider>(context, listen: false)
                                  .changeDescription(value);
                            },
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
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                        child: TextFormField(
                            controller: myController15,
                            autofocus: false,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter the club mission';
                              return null;
                            },
                            onChanged: (value) {
                              Provider.of<ClubsProvider>(context, listen: false)
                                  .changeMission(value);
                            },
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
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                        child: TextFormField(
                            controller: myController16,
                            autofocus: false,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter the club vision';
                              return null;
                            },
                            onChanged: (value) {
                              Provider.of<ClubsProvider>(context, listen: false)
                                  .changeVision(value);
                            },
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
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
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
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                            child: Text('Create'),
                            onPressed: () async {
                              if (_image == null) {
                                setState(() => txt = 'please input a photo');
                              }
                              if (_formKey.currentState!.validate() &&
                                  _image != null) {
                                var url = await uploadImageToFirebase(context);
                                //var url = 'test.png';
                                Provider.of<ClubsProvider>(context,
                                        listen: false)
                                    .requestClub(url);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Club Added')),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _image = File(pickedFile!.path);
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile!.path);
    });

    Navigator.pop(context);
  }
}

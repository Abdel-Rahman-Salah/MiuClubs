// ignore: file_names
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginsignup/layout/navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:loginsignup/models/club.dart';
import 'package:loginsignup/providers/clubs_provider.dart';
import 'package:loginsignup/services/fire_store_services.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class addClub extends StatefulWidget {
  final Club? club;

  addClub([this.club]);

  @override
  State<StatefulWidget> createState() {
    return addClubState();
  }
}

class addClubState extends State<addClub> {
  CollectionReference clubs = FirebaseFirestore.instance.collection('Clubs');
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  final myController6 = TextEditingController();

  File? _image;
  late String img;
  String txt = "";
  final picker = ImagePicker();
  @override
  void dispose() {
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }

  void initState() {
    if (widget.club == null) {
      //New Record
      myController.text = "";
      myController2.text = "";
      myController3.text = "";
      myController4.text = "";
      myController5.text = "";
      myController6.text = "";
    } else {
      //Controller Update
      myController.text = widget.club!.name;
      myController2.text = widget.club!.owner!;
      myController3.text = widget.club!.president!;
      myController4.text = widget.club!.description!;
      myController5.text = widget.club!.mission!;
      myController6.text = widget.club!.vision!;
      img = widget.club!.logopath;
      _image = File(img);
      print("image is");
      print(_image);
      print(widget.club!.clubId!);
    }

    super.initState();
  }

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
    String fileName = basename(_image!.path);
    FirebaseStorage storage = FirebaseStorage.instance;
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
      body: StreamBuilder(
          stream: clubs.snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: <Widget>[
                Column(
                  children: [
                    Container(height: 10, width: 24),
                    Text(
                      'Create A Club',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 20, 20, 20),
                  child: Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          child: ClipOval(
                            child: widget.club != null
                                ? Image.network(img,
                                    height: 150, width: 150, fit: BoxFit.fill)
                                : _image == null
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  txt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
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
                                  controller: myController,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Please enter the club name';
                                    return null;
                                  },
                                  onChanged: (value) {
                                    Provider.of<ClubsProvider>(context,
                                            listen: false)
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
                                        borderRadius:
                                            new BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(25.7),
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: TextFormField(
                                  controller: myController2,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Please enter the club Owner name';
                                    return null;
                                  },
                                  onChanged: (value) {
                                    Provider.of<ClubsProvider>(context,
                                            listen: false)
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
                                        borderRadius:
                                            new BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(25.7),
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: TextFormField(
                                  controller: myController3,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Please enter the club president name';
                                    return null;
                                  },
                                  onChanged: (value) {
                                    Provider.of<ClubsProvider>(context,
                                            listen: false)
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
                                        borderRadius:
                                            new BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(25.7),
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: TextFormField(
                                  controller: myController4,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Please enter the club description';
                                    return null;
                                  },
                                  onChanged: (value) {
                                    Provider.of<ClubsProvider>(context,
                                            listen: false)
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
                                        borderRadius:
                                            new BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(25.7),
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: TextFormField(
                                  controller: myController5,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Please enter the club mission';
                                    return null;
                                  },
                                  onChanged: (value) {
                                    Provider.of<ClubsProvider>(context,
                                            listen: false)
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
                                        borderRadius:
                                            new BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(25.7),
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: TextFormField(
                                  controller: myController6,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Please enter the club vision';
                                    return null;
                                  },
                                  onChanged: (value) {
                                    Provider.of<ClubsProvider>(context,
                                            listen: false)
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
                                        borderRadius:
                                            new BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(25.7),
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
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ))),
                                  child: Text('Create'),
                                  onPressed: () async {
                                    if (_image == null) {
                                      setState(
                                          () => txt = 'please input a photo');
                                    }
                                    if (_formKey.currentState!.validate() &&
                                        _image != null) {
                                      var url =
                                          await uploadImageToFirebase(context);
                                      //var url = 'test.png';
                                      var clubid = widget.club?.clubId;
                                      Provider.of<ClubsProvider>(context,
                                              listen: false)
                                          .saveClub(url, clubid);

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Club Added')),
                                      );
                                    }
                                    print(url);
                                    print(myController.text);
                                    print(myController2.text);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            );
          }),
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

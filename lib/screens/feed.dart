import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginsignup/layout/imports.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

CollectionReference PostsColl = FirebaseFirestore.instance.collection('Posts');
Stream<QuerySnapshot<Object?>> firestore = PostsColl.snapshots();
/*Stream<QuerySnapshot<Map<String, dynamic>>> firestore =
    FirebaseFirestore.instance.collection('Posts').snapshots();*/
List<Post> posts = [];

class Feed extends StatefulWidget {
  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    log('mel build ${posts.length}');
    return Scaffold(
      drawer: Drawerwidget(),
      appBar: Appbarwidget('Feed'),
      bottomSheet: Footerwidget(),
      body: StreamBuilder(
          stream: firestore,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState != ConnectionState.active) {
              return Text(snapshot.connectionState.toString());
            }
            if (!snapshot.hasData) {
              return Text('${snapshot},........no data');
            }
            var Qdata = (snapshot.data! as QuerySnapshot);
            for (int i = 0; i < Qdata.docs.length; i++) {
              String titleR = Qdata.docs[i]['title'].toString();
              String descR = Qdata.docs[i]['description'].toString();
              posts.add(Post(titleR, 'post${i + 1}.png', descR));
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FeedHeader(),
                    Column(
                      children: posts,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class FeedHeader extends StatefulWidget {
  @override
  State<FeedHeader> createState() => _FeedHeaderState();
}

class _FeedHeaderState extends State<FeedHeader> {
  final _formKey = GlobalKey<FormState>();

  File? _image;
  final picker = ImagePicker();

  Future uploadImageToFirebase(BuildContext context) async {
    log('function');
    String fileName = basename(_image!.path);
    log('basename ${fileName}');
    FirebaseStorage storage = FirebaseStorage.instance;
    log('storage');
    Reference ref = storage.ref().child('uploads/$fileName');
    log('ref');
    UploadTask uploadTask = ref.putFile(_image!);
    log('ptfile ${uploadTask}');
    //uploadTask.whenComplete(() {
    var downloadURL =
        (await (await uploadTask.whenComplete(() => ref.getDownloadURL()))
                .ref
                .getDownloadURL())
            .toString();
    log('down');
    //}).catchError((onError) {
    //print(onError);
    //});

    return downloadURL;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Post data missing';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListTile(
                  onTap: () {
                    _openCamera(context);
                    //log(_image!.path.toString());
                  },
                  title: Text('Post')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                  onPressed: () async {
                    String url = await uploadImageToFirebase(context);
                    log('3ada');
                    log(url.toString());
                    PostsColl.add({
                      'title': 'yarab',
                      'image': url,
                      'description': 'yeshtaghal',
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Club Added')),
                    );

                    print(url);
                  },
                  child: Text('Post')),
            )
          ],
        ));
  }

  File? PIF;
  Future<String> postpost(Context) async {
    var context = Context;

    final Ipicker = ImagePicker();
    log('3ada 3');
    uploadImageToFirebase(Future<String> pif) {
      log('awel eltanya');
      log(PIF.toString());
      log('magatsh');
      String fileName = basename(PIF!.path);
      log('up 1');
      FirebaseStorage storage = FirebaseStorage.instance;
      log('up 2');
      Reference ref = storage.ref().child('uploads/$fileName');
      log('up 3');
      UploadTask uploadTask = ref.putFile(PIF!);
      log('up 4');
      var url;
      url = ref.getDownloadURL();
      log('up 5');
      return url;
    }

    Future<String> pickimage() async {
      final picked = await Ipicker.getImage(source: ImageSource.camera);
      log(picked.toString());
      setState(() {
        PIF = File(picked!.path);
      });
      log('image taken');
      return PIF!.path;
    }

    log('abl pick image');

    log(pickimage().toString());
    log('ba3d pick image');
    String url = await uploadImageToFirebase(pickimage());
    log('the url is ${url}');

    Post NewPost = new Post('Added post', url, 'description');
    posts.clear();
    PostsColl.add({
      'title': NewPost.title,
      'image': NewPost.image,
      'description': NewPost.description,
    });
    return url;
    log(NewPost.title.toString());
    log(posts.length.toString());
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile!.path);
      log(_image!.path.toString());
    });
    //Navigator.pop(context);
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _image = File(pickedFile!.path);
    });

    //Navigator.pop(context);
  }
}

class Post extends StatelessWidget {
  String? title;
  String? image;
  String? description;
  Post(String title, String image, String description) {
    this.title = title;
    this.image = image;
    this.description = description;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 50,
                child: Row(
                  children: [
                    Text(
                      title!,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/' + image!,
                      fit: BoxFit.fitWidth,
                    ),
                    width: MediaQuery.of(context).size.width - 20,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Flexible(
                        child: Text(
                      description!,
                      style: TextStyle(fontSize: 15),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}

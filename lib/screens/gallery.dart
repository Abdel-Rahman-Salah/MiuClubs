import 'package:flutter/material.dart';
import 'package:nayraa/gallery.dart';
import 'package:firebase_core/firebase_core.dart';

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /* var container = Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            IconButton(
                onPressed: () {
                  // MyNavigator.goToAddClub(context);
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey[700],
                ))
          ]), */
    // Wrap(alignment: ,)
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
      body: Container(
          child: GridView.builder(
        padding: EdgeInsets.all(12.0),
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 6.0),
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            'assets/images/e.jpg',
            fit: BoxFit.cover,
          );
        },
      )
          //]
          //)
          //])
          //])
          ),
    );
  }
}

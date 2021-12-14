import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerwidget(),
      appBar: Appbarwidget('clubpage'),
      bottomSheet: Container(
        padding: EdgeInsets.only(top: 2),
        child: Center(
          child: Text(
            'hi',
            style: TextStyle(color: Colors.white),
          ),
        ),
        color: Color.fromRGBO(51, 51, 51, 1.0),
        width: MediaQuery.of(context).size.width,
        height: 40,
      ),
    );
  }
}

class Drawerwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer();
  }
}

class Appbarwidget extends StatelessWidget with PreferredSizeWidget {
  String? page;
  Appbarwidget(page) {
    this.page = page;
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [Icon(Icons.logout)],
      bottom: PreferredSize(
          child:
              Text(page!, style: TextStyle(fontSize: 30, color: Colors.white)),
          preferredSize: Size(40, 40)),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(51, 51, 51, 1.0),
      iconTheme: IconThemeData(color: Color.fromRGBO(254, 3, 3, 1.0)),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}

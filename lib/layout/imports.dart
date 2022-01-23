import 'package:flutter/material.dart';
import 'package:loginsignup/layout/navigator.dart';
import 'package:loginsignup/others/signin_old.dart';
import 'package:loginsignup/screens/signin.dart';
import 'package:loginsignup/services/authentication_service.dart';
import 'package:provider/src/provider.dart';

/*class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerwidget(),
      appBar: Appbarwidget('clubpage'),
      bottomSheet: Footerwidget(),
    );
  }
}*/

class Footerwidget extends StatelessWidget {
  const Footerwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: Text(
        'CopyRights@Team9',
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
      color: Color.fromRGBO(51, 51, 51, 1.0),
      width: MediaQuery.of(context).size.width,
      height: 30,
    );
  }
}

class Drawerwidget extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  String? _currentPage;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(51, 51, 51, 1.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: DrawerHeader(
                child: Text(
              'MIU Clubs',
              style: TextStyle(fontSize: 26, color: Colors.white),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: ListTile(
              onTap: () {
                Navigator.of(context).pop();
                MyNavigator.gofeed(context);
              },
              title: Text(
                'Feed',
                style: TextStyle(
                    fontSize: 24, color: Color.fromRGBO(254, 3, 3, 1.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListTile(
              onTap: () {
                MyNavigator.goTimeline(context);
              },
              title: Text(
                'TimeLine',
                style: TextStyle(
                    fontSize: 24, color: Color.fromRGBO(254, 3, 3, 1.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListTile(
              onTap: () {
                MyNavigator.goprofile(context);
              },
              title: Text(
                'Profile',
                style: TextStyle(
                    fontSize: 24, color: Color.fromRGBO(254, 3, 3, 1.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListTile(
              onTap: () {
                MyNavigator.gogallery(context);
              },
              title: Text(
                'Gallery',
                style: TextStyle(
                    fontSize: 24, color: Color.fromRGBO(254, 3, 3, 1.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListTile(
              onTap: () {
                MyNavigator.gorequest(context);
              },
              title: Text(
                'Request Club',
                style: TextStyle(
                    fontSize: 24, color: Color.fromRGBO(254, 3, 3, 1.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListTile(
              onTap: () {
                MyNavigator.goloc(context);
              },
              title: Text(
                'Location',
                style: TextStyle(
                    fontSize: 24, color: Color.fromRGBO(254, 3, 3, 1.0)),
              ),
            ),
          )
        ],
      ),
    );
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
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(51, 51, 51, 1.0),
                onPrimary: Color.fromRGBO(254, 3, 3, 1.0)),
            onPressed: () {
              context.read<AuthenticationService>().signOut();
              Navigator.pushAndRemoveUntil<void>(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => Signin()),
                ModalRoute.withName('/login'),
              );
            },
            child: Icon(Icons.logout))
      ],
      bottom: PreferredSize(
          child: Text(page!,
              style: TextStyle(
                  fontSize: 30, color: Color.fromRGBO(254, 3, 3, 1.0))),
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

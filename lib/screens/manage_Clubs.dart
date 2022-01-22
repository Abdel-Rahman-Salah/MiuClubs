// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loginsignup/layout/navigator.dart';
import 'package:loginsignup/providers/clubs_provider.dart';
import 'package:loginsignup/screens/manage_Clubs.dart';
import 'package:provider/provider.dart';
import '../models/club.dart';

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ClubsProvider(),
//       child: MaterialApp(title: 'Provider Demo', home: ManageClubs()),
//     );
//   }
// }

class ManageClubs extends StatelessWidget {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Manage Clubs",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.red),
            ),
          ),
          Expanded(
            child: Consumer<ClubsProvider>(builder: (context, data, child) {
              data.readMap();
              return ListView.builder(
                itemCount: data.getClubs.length,
                itemBuilder: (context, int index) {
                  {
                    String path = data.getClubs[index].logopath;
                    print(path);
                    return Container(
                      color: Colors.grey[200],
                      // width:MediaQuery.of(context).size.width,
                      // height:MediaQuery.of(context).size.height,
                      child: ListTile(
                        leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 64,
                            maxHeight: 64,
                          ),
                          // child: Image.asset(
                          //   'assets/images/$path',
                          //   fit: BoxFit.cover,
                          // ),
                          child: Image.network(path),
                        ),
                        trailing: Wrap(
                          spacing: 20,
                          children: [
                            IconButton(
                                onPressed: () {
                                  MyNavigator.goToAddClub(context);
                                },
                                icon: Icon(
                                  Icons.settings,
                                  color: Colors.grey[700],
                                )),
                            OutlinedButton(
                                onPressed: () {
                                  Provider.of<ClubsProvider>(context,
                                          listen: false)
                                      .removeClubs(index);
                                },
                                child: Icon(
                                  Icons.delete_rounded,
                                  color: Colors.grey[700],
                                )),
                          ],
                        ),
                        title: Text(
                          data.getClubs[index].name,
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      //color: Colors.grey,
                    );
                  }
                },
              );
            }),
          ),
          IconButton(
            onPressed: () {
              //MyNavigator.goToAddClub(context);
              context.read<ClubsProvider>().addClubs("mun", 'mun.png');
              //context.read<ClubsProvider>().addClubs("Hello", "Bye");
              //MyNavigator.goToAddClub(context);
            },
            icon: Icon(Icons.add_circle_rounded),
            color: Colors.red[700],
            iconSize: 50,
          ),
        ],
      ),
    );
  }
}

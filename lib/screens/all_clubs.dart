// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loginsignup/layout/navigator.dart';
import 'package:loginsignup/providers/clubs_provider.dart';
import 'package:loginsignup/screens/manage_Clubs.dart';
import 'package:loginsignup/screens/profile.dart';
import 'package:provider/provider.dart';
import '../models/club.dart';
import 'add_club.dart';

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

class AllClubs extends StatelessWidget {
  @override
  
  

  Widget build(BuildContext context) {
    final clubs = Provider.of<List<Club>>(context);
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
              "All Clubs",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.red),
            ),
          ),
          Expanded(
            child: (clubs != null)
                ? ListView.builder(
                    itemCount: Provider.of<List<Club>>(context).length,
                    itemBuilder: (context, index) {
                      {
                        String path = clubs[index].logopath;
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
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  addClub(clubs[index])));
                                    },
                                    icon: Icon(
                                      Icons.view_agenda,
                                      color: Colors.grey[700],
                                    )),
                                
                              ],
                            ),
                            title: InkWell(
                              onTap: ()
                              {
                                 Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ClubProfile( index: index)));
                              },
                              child: Text(
                                clubs[index].name,
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ),
                          ),
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          //color: Colors.grey,
                        );
                      }
                    },
                  )
                : Center(child: Text("No clubs to show.")),
          ),
       
        ],
      ),
    );
  }
}

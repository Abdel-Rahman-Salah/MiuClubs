import 'package:flutter/material.dart';
import '../models/club.dart';

// void main() {
//   runApp(MaterialApp(
//     home: ManageClubs(),
//   ));
// }

class ManageClubs extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ManageClubs> {
  List<Club> clubs = [
    Club.named("Tedx", "tedx.png"),
    Club.named("MUN", "mun.png"),
    Club.named("GL", "gamerslegacy.png"),
    Club.named("Move", "move.png")
  ];
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
            child: ListView.builder(
              itemCount: clubs.length,
              itemBuilder: (context, int index) {
                {
                  String path = clubs.elementAt(index).logopath;
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
                        child: Image.asset(
                          'assets/images/$path',
                          fit: BoxFit.cover,
                        ),
                      ),
                      trailing: Wrap(
                        spacing: 20,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.settings,
                                color: Colors.grey[700],
                              )),
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  clubs.removeAt(index);
                                });
                              },
                              child: Icon(
                                Icons.delete_rounded,
                                color: Colors.grey[700],
                              )),
                        ],
                      ),
                      title: Text(
                        clubs.elementAt(index).name,
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
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_circle_rounded),
            color: Colors.red[700],
            iconSize: 50,
          ),
        ],
      ),
    );
  }
}

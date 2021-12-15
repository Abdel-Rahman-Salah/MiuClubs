import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Club> clubs = [
    Club(logo: "tedx.png", name: "Tedx"),
    Club(logo: "mun.png", name: "MUN"),
    Club(logo: "gamerslegacy.png", name: "GL"),
    Club(logo: "move.png", name: "Move")
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
          Text("Manage Clubs djdj",
          style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: clubs.length,
              itemBuilder: (context, int index) {
                {
                  String path = clubs.elementAt(index).logo;
                  print(path);
                  return Container(
                    color:Colors.grey[200],
                    // width:MediaQuery.of(context).size.width,
                    // height:MediaQuery.of(context).size.height,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(200)),
                      ),
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 44,
                          minHeight: 44,
                          maxWidth: 64,
                          maxHeight: 64,
                        ),
                        child: Image.asset('assets/images/$path', fit: BoxFit.cover,
                        
                        ),
                      ),
                      trailing: Wrap(
                        spacing: 45,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  clubs.removeAt(index);
                                });
                              },
                              child: Icon(Icons.delete)),
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
        ],
      ),
    );
  }
}

class Club {
  String logo, name;
  Club({required this.logo, required this.name});
}

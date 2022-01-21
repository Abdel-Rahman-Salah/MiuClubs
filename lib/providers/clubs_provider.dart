import 'package:flutter/cupertino.dart';
import '../models/club.dart';
import '../services/fire_store_services.dart';
class ClubsProvider extends ChangeNotifier {
  //Clubs List
  
  List<Club> _clubs = <Club>[];
   late FireStoreServicesx instance = FireStoreServicesx(); 
    readMap() async {
     var clubsMap = await instance.getClubs();
     for(int i=0;i<clubsMap.length;i++)
     {
        Club c=Club.named(clubsMap[i]['Club_Name'], clubsMap[i]['Club_Image']);
       _clubs.add(c);
     }
    notifyListeners();
    }
  List<Club> get getClubs {
    return _clubs;
  }

// function to add data to list of clubs
  void addClubs(String name, String logopath) {
    Club club = new Club.named(name, logopath);

    _clubs.add(club);

    notifyListeners();
  }

  // function to remove or delete clubs by using list index position
  void removeClubs(int index) {
    _clubs.removeAt(index);
    notifyListeners();
  }
  
}
      


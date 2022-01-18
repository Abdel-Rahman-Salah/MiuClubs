import 'package:flutter/cupertino.dart';
import '../models/club.dart';

class ClubsProvider extends ChangeNotifier {
  //Clubs List
  List<Club> _clubs = <Club>[];

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
      


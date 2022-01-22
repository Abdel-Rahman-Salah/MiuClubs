import 'package:flutter/cupertino.dart';
import '../models/club.dart';
import '../services/fire_store_services.dart';
import 'package:uuid/uuid.dart';

class ClubsProvider extends ChangeNotifier {
  //Clubs List
  List<Club> _clubs = <Club>[];
  String? _name;
  String? _owner;
  String? _clubId;
  String? _logopath;
  String? _president;
  String? _mission;
  String? _vision;
  String? _description;
  var uuid = Uuid();

//Getters
  String? get name => _name;
  String? get owner => _owner;
  String? get clubId => _clubId;
  String? get logopath => _logopath;
  String? get description => _description;
  String? get vision => _vision;
  String? get mission => _mission;
  String? get president => _president;
//Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeOwner(String value) {
    _owner = value;
    notifyListeners();
  }

  changeDescription(String value) {
    _description = value;
    notifyListeners();
  }

  changePresident(String value) {
    _president = value;
    notifyListeners();
  }

  changeMission(String value) {
    _mission = value;
    notifyListeners();
  }

  changeVision(String value) {
    _vision = value;
    notifyListeners();
  }

  loadValues(Club club) {
    _name = club.name;
    _logopath = club.logopath;
    _clubId = club.clubId;
    _president = club.president;
    _owner = club.owner;
    _vision = club.vision;
    _description = club.description;
  }

  late FireStoreServicesx instance = FireStoreServicesx();
  readMap() async {
    var clubsMap = await instance.getClubs();
    for (int i = 0; i < clubsMap.length; i++) {
      Club c = Club.named(clubsMap[i]['name'], clubsMap[i]['logopath']);
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

  saveClub(var logopath) {
    print(_clubId);
    print(_name);
    if (_clubId == null) {
      var newClub = Club(name!, uuid.v4(), logopath!, owner!, president!,
          description!, mission!, vision!);
      FireStoreServicesx.saveClub(newClub);
      notifyListeners();
    } else {
      //Update
      var updatedClub = Club(name!, clubId!, logopath!, owner!, president!,
          description!, mission!, vision!);
      FireStoreServicesx.saveClub(updatedClub);
      notifyListeners();
    }
  }
}

import '../models/event.dart';
import 'package:flutter/cupertino.dart';
import '../services/fire_store_services.dart';
import 'package:uuid/uuid.dart';

class EventsProvider extends ChangeNotifier {
  //Clubs List
  List<Event> _events = <Event>[];
  String? _name;
  String? _day;
  String? _year;
  String? _month;
  String? _imagepath;
  String? _eventId;
  var uuid = Uuid();

  //Getters
  String? get name => _name;
  String? get day => _day;
  String? get year => _year;
  String? get month => _month;
  String? get eventId => _eventId;
  String? get imagepath => _imagepath;
//Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeDay(String value) {
    _day = value;
    notifyListeners();
  }

  changeMonth(String value) {
    _month = value;
    notifyListeners();
  }

  changeYear(String value) {
    _year = value;
    notifyListeners();
  }

  changeImagepath(String value) {
    _imagepath = value;
    notifyListeners();
  }

  loadValues(Event event) {
    _name = event.name;
    _day = event.day;
    _month = event.month;
    _year = event.year;
    _eventId = event.eventId;
    _imagepath = event.imagepath;
  }

  late FireStoreServicesx instance = FireStoreServicesx();
  readMap() async {
    var eventsMap = await instance.getEvents();
    for (int i = 0; i < eventsMap.length; i++) {
      Event c = Event.named(eventsMap[i]['name'], eventsMap[i]['imagepath']);
      _events.add(c);
    }
    notifyListeners();
  }

  List<Event> get getEvents {
    return _events;
  }

  void addEvents(String name, String imagepath) {
    Event event = new Event.named(name, imagepath);

    _events.add(event);

    notifyListeners();
  }

  void removeClubs(int index) {
    _events.removeAt(index);
    notifyListeners();
  }

  saveEvent(var logopath) {
    print(_eventId);
    print(_name);
    if (_eventId == null) {
      var newEvent = Event(name!, uuid.v4(), day!, month!, year!, imagepath!);
      FireStoreServicesx.saveEvent(newEvent);
      notifyListeners();
    } else {
      //Update
      var updatedEvent =
          Event(name!, eventId!, day!, month!, year!, imagepath!);
      FireStoreServicesx.saveEvent(updatedEvent);
      notifyListeners();
    }
  }
}

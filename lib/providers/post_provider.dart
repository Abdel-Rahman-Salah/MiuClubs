import 'package:flutter/cupertino.dart';
import '../models/post.dart';
import '../services/fire_store_services.dart';
import 'package:uuid/uuid.dart';

class PostProvider extends ChangeNotifier {
  //Clubs List
  List<Post> _clubs = <Post>[];
  String? _title;
  String? _postId;
  String? _description;
  String? _logopath;
  var uuid = Uuid();

//Getters
  String? get title => _title;
  String? get postId => _postId;
  String? get description => _description;
  String? get logopath => _logopath;

//Setters
  changeTitle(String value) {
    _title = value;
    notifyListeners();
  }

  changeDescription(String value) {
    _description = value;
    notifyListeners();
  }

  late FireStoreServicesx instance = FireStoreServicesx();

// function to add data to list of clubs

  // function to remove or delete clubs by using list index position
  void removeClubs(String clubId) {
    FireStoreServicesx.removeClub(clubId);
    notifyListeners();
  }

  void removeRequests(String clubId) {
    FireStoreServicesx.removeRequestClub(clubId);
    notifyListeners();
  }

  savePost(var logopath) {
    var newPost = Post(title!, uuid.v4(), description!, logopath!);
    FireStoreServicesx.savePost(newPost);
    notifyListeners();
  }
}

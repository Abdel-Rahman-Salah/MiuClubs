class Post {
  String title;
  String postId;
  String description;
  String logopath;
  Post(this.title, this.postId, this.description, this.logopath);

  Map<String, dynamic> toMap() => {
        'title': title,
        'postId': postId,
        'logopath': logopath,
        'description': description,
      };

  Post.fromFirestore(Map firestore)
      : title = firestore['title'],
        postId = firestore['postId'],
        logopath = firestore['logopath'],
        description = firestore['description'];
}

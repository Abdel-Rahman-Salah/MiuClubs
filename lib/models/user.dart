class User1 {
  String name;
  String userId;
  bool type;
  String email;
  String? password;
  User1(this.name, this.userId, this.type, this.email, this.password);

  Map<String, dynamic> toMap() => {
        'name': name,
        'type': type,
        'email': email,
        'userId': userId,
      };

  User1.fromFirestore(Map firestore)
      : name = firestore['name'],
        email = firestore['email'],
        userId = firestore['userId'],
        type = firestore['type'];
}

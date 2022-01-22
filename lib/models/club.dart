class Club {
  final String name;
  final String? clubId;
  final String logopath;
  final String? owner;
  final String? president;
  final String? description;
  final String? mission;
  final String? vision;

  Club(this.name, this.clubId, this.logopath, this.owner, this.president,
      this.description, this.mission, this.vision);
  //Club.named(this.name, this.logopath);

  Map<String, dynamic> toMap() => {
        'name': name,
        'clubId': clubId,
        'logopath': logopath,
        'owner': owner,
        'president': president,
        'description': description,
        'mission': mission,
        'vision': vision,
      };

  Club.fromFirestore(Map firestore)
      : name = firestore['name'],
        clubId = firestore['clubId'],
        logopath = firestore['logopath'],
        owner = firestore['owner'],
        president = firestore['president'],
        mission = firestore['mission'],
        vision = firestore['vision'],
        description = firestore['description'];
}

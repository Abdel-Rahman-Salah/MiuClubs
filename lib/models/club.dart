class Club {
  String name;
  String? clubId;
  String logopath;
  String? owner;
  String? president;
  String? description;
  String? mission;
  String? vision;
  int? status;

  Club(this.name, this.clubId, this.logopath, this.owner, this.president,
      this.description, this.mission, this.vision);

  Club.request(this.name, this.clubId, this.logopath, this.owner,
      this.president, this.description, this.mission, this.vision, this.status);
  Club.named(this.name, this.logopath);

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

  Map<String, dynamic> reqtoMap() => {
        'name': name,
        'clubId': clubId,
        'logopath': logopath,
        'owner': owner,
        'status': status,
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

  Club.RequestsfromFirestore(Map firestore)
      : name = firestore['name'],
        clubId = firestore['clubId'],
        logopath = firestore['logopath'],
        owner = firestore['owner'],
        president = firestore['president'],
        status = firestore['status'],
        mission = firestore['mission'],
        vision = firestore['vision'],
        description = firestore['description'];
}

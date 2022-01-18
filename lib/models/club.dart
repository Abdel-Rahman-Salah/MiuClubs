class Club {
  String name;
  String logopath;
  String? owner;
  String? president;
  String? description;
  String? mission;
  String? vision;

  Club(this.name, this.logopath, this.owner, this.president, this.description,
      this.mission, this.vision);
  Club.named(this.name, this.logopath);

  Map<String, dynamic> toMap() => {
        'name': name,
        'owner': owner,
        'president': president,
        'description': description,
        'mission': mission,
        'vision': vision,
      };
}

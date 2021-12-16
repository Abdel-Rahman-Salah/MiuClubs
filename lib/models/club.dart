class Club {
  String name;
  String logopath;
  String? owner;
  String? president;
  String? description;
  String? mission;
  String? vision;
  List<String>? commitees;

  Club(this.name, this.logopath, this.owner, this.president, this.description,
      this.mission, this.vision, this.commitees);
  Club.named(this.name, this.logopath);
}

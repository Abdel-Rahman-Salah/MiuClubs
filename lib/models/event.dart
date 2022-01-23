class Event {
  String name;
  String? day;
  String? month;
  String? year;
  String imagepath;
  String? eventId;

  Event(
      this.name, this.eventId, this.day, this.month, this.year, this.imagepath);
  Event.named(this.name, this.imagepath);

  Map<String, dynamic> toMap() => {
        'name': name,
        'day': day,
        'month': month,
        'year': year,
        'imagepath': imagepath,
      };

  Event.fromFirestore(Map firestore)
      : name = firestore['name'],
        day = firestore['day'],
        month = firestore['month'],
        year = firestore['year'],
        imagepath = firestore['imagepath'];
}

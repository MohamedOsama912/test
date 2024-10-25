class Character {
  int? id;
  late String name;
  late String status;
  late String species;
  late String gender;
  late String image;
  late List<dynamic>? episode;

  Character.fromjson(json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    gender = json['gender'];
    image = json['image'];
    episode = json['episode'];
  }
}

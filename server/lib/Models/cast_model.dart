class Cast {
  late String id;
  late String knownForDepartment;
  late String name;
  late String originalName;
  late double popularity;
  late String profilePath;
  late String character;

  Cast.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    character = json['character'];
  }
}


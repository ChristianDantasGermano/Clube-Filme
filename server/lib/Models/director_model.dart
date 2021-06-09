class Director {
  late String id;
  late String name;
  late String originalName;
  late double popularity;
  late String profilePath;
  late String department;

  Director.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath= "";
    if(json['profile_path'] != null){
      profilePath = json['profile_path'];
    }
    department = json['department'];
  }
}
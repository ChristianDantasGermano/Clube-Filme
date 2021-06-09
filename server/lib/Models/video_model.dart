class Video {
  late String key;
  late String link;
  late String site;
  late String type;

  Video.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    site = json['site'];
    type = json['type'];
    link = "";
    if (site == 'YouTube') {
      link = 'https://www.youtube.com/watch?v=$key';
    }
  }
}

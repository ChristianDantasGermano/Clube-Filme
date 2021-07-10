class Video {
  String link;
  String site;
  String tipo;

  Video({required this.link, required this.site, required this.tipo});

  factory Video.fromDocument(Map<String, dynamic> doc) {
    return Video(link: doc['Link'], site: doc['Site'], tipo: doc['Tipo']);
  }
}

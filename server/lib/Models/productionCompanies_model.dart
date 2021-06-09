class ProductionCompanies {
  late String logoPath;
  late String name;

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    logoPath = json['logo_path'];
    name = json['name'];
  }
}
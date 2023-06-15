class CityModel {
  String city = "";
  CityModel(this.city);
  CityModel.fromJson(Map<String, dynamic> json) {
    city = json["city"] ?? "";
  }
}

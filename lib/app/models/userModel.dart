

// class UserModel {
//   String email = "";
//   String userid = "";
//   String username = "";
//   double latitude = 0;
//   double longitude = 0;
//   String city = "";
//   Units units = Units(temperature: "", humidity: "");
//   UserModel(
//       {required this.email,
//       required this.userid,
//       required this.username,
//       required this.latitude,
//       required this.longitude,
//       required this.city,
//       required this.units});
//   UserModel.froDoc(Map<dynamic, dynamic> json) {
//     email = json["email"] ?? "";
//     userid = json["userId"] ?? "";
//     username = json["username"] ?? "";
//     latitude = json["latitude"] ?? 0;
//     longitude = json["longitude"] ?? 0;
//     city = json["city"] ?? "";
//     units = Units.fromJson(json["Units"]);
//   }
// }

// class Units {
//   String temperature = "";
//   String humidity = "";
//   Units({required this.humidity, required this.temperature});
//   Units.fromJson(Map<dynamic, dynamic> js) {
//     temperature = js["temperature"] ?? "";
//     humidity = js["humidity"] ?? "";
//   }
// }

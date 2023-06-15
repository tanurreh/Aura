import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? uid;
   String? userName;
   String? emailaddress;
  String? connectedDevice;
   String? deviceNumber;
  UserModel({
    this.uid,
    this.userName,
    this.emailaddress,
    this.connectedDevice,
    this.deviceNumber,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'userName': userName,
      'emailaddress': emailaddress,
      'connectedDevice': connectedDevice,
      'deviceNumber': deviceNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      emailaddress: map['emailaddress'] != null ? map['emailaddress'] as String : null,
      connectedDevice: map['connectedDevice'] != null ? map['connectedDevice'] as String : null,
      deviceNumber: map['deviceNumber'] != null ? map['deviceNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

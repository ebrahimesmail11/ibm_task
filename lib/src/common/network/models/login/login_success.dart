
import 'dart:convert';

LoginSuccess loginSuccessFromJson(String str) => LoginSuccess.fromJson(json.decode(str));

String temperaturesToJson(LoginSuccess data) => json.encode(data.toJson());
class LoginSuccess {
  bool? status;
  String? message;
  Data? data;

  LoginSuccess({
    this.status,
    this.message,
    this.data,
  });
  factory LoginSuccess.fromJson(Map<String, dynamic> json) => LoginSuccess(
        status: json["status"],
        message: json["message"],
        data:json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        };
}
class Data {
  int ? id;
  String ? name;
  String ? email;
  String ? phone;
  String ? image;
  String ? token;
  int? points;
  int? credit;
  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.token,
    this.points,
    this.credit,
  });
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        token: json["token"],
        points: json["points"],
        credit: json["credit"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone, 
        "image": image,
        "token": token,
        "points": points,
        "credit": credit,
      };
}
import 'package:amquick/all_export.dart';

class UserModel {
  String user;
  String name;
  List<dynamic>? quyen;
  PhongBanModel? phongban;
  String? avatar;

  UserModel(
      {this.user = "", this.name = "", this.quyen, this.phongban, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      user: json["user"],
      name: json["name"],
      quyen: json["quyen"] ?? null,
      phongban: json["phongban"]!=null ? PhongBanModel.fromJson(json["phongban"]) : null ,
      avatar: json["avatar"]);

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "quyen": quyen,
        "phongban": phongban,
        "avatar": avatar
      };
}

import 'package:amquick/all_export.dart';

class UserModel {
  String id;
  String tendangnhap;
  String hoten;
  String matkhau;
  List<String>? quyen;
  PhongBanModel? phongban;
  String? anhdaidien;

  UserModel({this.id="",this.tendangnhap = "", this.hoten = "", this.matkhau = "", this.quyen, this.phongban, this.anhdaidien});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["_id"],
      tendangnhap: json["tendangnhap"],
      matkhau: json["matkhau"],
      hoten: json["hoten"],
      quyen: json["quyen"]!=null ? List<String>.from(json["quyen"]) : null,
      phongban: json["phongban"]!=null ? PhongBanModel.fromJsonEmbed(json["phongban"]) : null ,
      anhdaidien: json["anhdaidien"]
  );

  Map<String, dynamic> toJson() => {
        "id":id,
        "tendangnhap": tendangnhap,
        "matkhau": matkhau,
        "hoten": hoten,
        "quyen": quyen,
        "phongban": phongban!=null ? phongban!.toJson() : null ,
        "anhdaidien": anhdaidien
      };
}

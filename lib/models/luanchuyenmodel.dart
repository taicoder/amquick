import 'package:amquick/all_export.dart';

class LuanChuyenModel {
  DateTime? ngaychuyen;
  String? nguoinhan;
  PhongBanModel? phongban;

  LuanChuyenModel({
    this.ngaychuyen ,
    this.nguoinhan,
    this.phongban
  });

  factory LuanChuyenModel.fromJson(Map<String, dynamic> json) => LuanChuyenModel(
      ngaychuyen: json["ngaychuyen"],
      nguoinhan: json["nguoinhan"],
      phongban: json["phongban"]!=null ? PhongBanModel.fromJson(json["phongban"]) : null
  );

  Map<String, dynamic> toJson() => {
        "ngaychuyen": ngaychuyen,
        "nguoinhan": nguoinhan,
        "phongban": phongban
      };
}

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
      ngaychuyen:  DateTime.parse(json["ngaychuyen"]),
      nguoinhan: json["nguoinhan"] ?? "",
      phongban: json["phongban"]!=null ? PhongBanModel.fromJsonEmbed(json["phongban"]) : null
  );

  Map<String, dynamic> toJsonDisplay() => {
        "ngaychuyen": convertStringDateFromDateTime(ngaychuyen),
        "nguoinhan": nguoinhan,
        "phongban": phongban==null ? "null" : phongban!.toJson()
      };

  Map<String, dynamic> toJson() => {
    "ngaychuyen": convertStringDateFromDateTime(ngaychuyen),
    "nguoinhan": nguoinhan,
    "phongban": phongban==null? null : phongban!.toJson()
  };
}

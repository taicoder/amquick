import 'package:amquick/all_export.dart';

class PhongBanModel {
  String idpb;
  String tenpb;

  PhongBanModel({this.idpb = "0", this.tenpb = ""});

  //gọi từ danh mục
  factory PhongBanModel.fromJson(Map<String, dynamic> json) => PhongBanModel(
      idpb: json["_id"] ?? "" ,
      tenpb: json["tenpb"] ?? "" ,
  );

  //gọi từ các bảng khác
  factory PhongBanModel.fromJsonEmbed(Map<String, dynamic> json) => PhongBanModel(
    idpb: json["idpb"] ?? "" ,
    tenpb: json["tenpb"] ?? "" ,
  );

  Map<String, dynamic> toJson() => {
    "idpb":  idpb,
    "tenpb": tenpb
  };
}

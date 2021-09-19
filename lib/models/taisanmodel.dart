import 'package:amquick/all_export.dart';

class TaiSanModel {
  String id;
  String ten;
  double gia;
  LoaiTSModel? loaits;
  List<int>? kiemke;
  List<LuanChuyenModel>? luanchuyen;
  String? mota;
  TaoModel? tao;
  SuaDoiModel? suadoi;

  TaiSanModel({
    this.id ="0",
    this.ten = "",
    this.gia=0,
    this.loaits,
    this.kiemke,
    this.luanchuyen,
    this.mota,
    this.tao,
    this.suadoi
  });

  factory TaiSanModel.fromJson(Map<String, dynamic> json) => TaiSanModel(
      id: json["_id"].toString(),
      ten: json["ten"],
      gia: json["gia"]==null? 0 : json["gia"].toDouble(),
      loaits: LoaiTSModel.fromJson(json["loaits"]) ,
      kiemke: json["kiemke"],
      luanchuyen: json["luanchuyen"],
      mota: json["mota"],
      tao: json["tao"],
      suadoi: json["suadoi"]
  );


}

import 'dart:convert';
import 'package:get/utils.dart';
import 'package:amquick/all_export.dart';

class TaiSanModel {
  String id;
  String ten;
  double gia;
  LoaiTSModel? loaits;
  List<KiemKeModel>? kiemke;
  List<LuanChuyenModel>? luanchuyen;
  String mota;
  TaoModel? tao;
  SuaDoiModel? suadoi;
  List<String>? hinhanh;
  ThanhLyModel? thanhly;

  TaiSanModel({
    this.id ="0",
    this.ten = "",
    this.gia=0,
    this.loaits,
    this.kiemke,
    this.luanchuyen,
    this.mota="",
    this.tao,
    this.suadoi,
    this.hinhanh,
    this.thanhly
  });

  factory TaiSanModel.fromJson(Map<String, dynamic> json) => TaiSanModel(
      id: json["_id"].toString(),
      ten: json["ten"],
      gia: json["gia"]==null? 0 : json["gia"].toDouble(),
      loaits: LoaiTSModel.fromJsonEmbeded(json["loaits"]) ,
      kiemke: json["kiemke"]!= null ? (json["kiemke"] as List).map((e) => KiemKeModel.fromJson(e)).toList() : null,
      luanchuyen: json["luanchuyen"]!=null ? (json["luanchuyen"] as List).map((e) => LuanChuyenModel.fromJson(e)).toList() : null,
      mota: json["mota"] ?? "",
      tao: json["tao"] == null ? null : TaoModel.fromJson(json["tao"]),
      suadoi: json["suadoi"] == null ? null : SuaDoiModel.fromJson(json["suadoi"]),
      hinhanh: json["hinhanh"]==null ? null: List<String>.from(json["hinhanh"]),
      thanhly: json["thanhly"] == null ? null : ThanhLyModel.fromJson(json["thanhly"])
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "ten": ten,
    "gia": gia,
    "loaits": loaits==null ? null : loaits!.toJson(),
    "kiemke": kiemke!=null ? kiemke!.map((model)=> model.toJson()).toList() : null ,
    "luanchuyen": luanchuyen!=null ? luanchuyen!.map((model)=> model.toJson()).toList() : null ,
    "mota": mota,
    "tao": tao==null ? null : tao!.toJson(),
    "suadoi": suadoi==null ? null : suadoi!.toJson(),
    "hinhanh": hinhanh,
    "thanhly": thanhly==null ? null : thanhly!.toJson()
  };

}

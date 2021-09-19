import 'package:amquick/all_export.dart';

class LoaiTSModel {
  String id;
  String ten;

  LoaiTSModel(
      {this.id = "", this.ten = ""});

  factory LoaiTSModel.fromJson(Map<String, dynamic> json) => LoaiTSModel(
      id: json["_id"].toString(),
      ten: json["ten"]
  );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ten": ten
      };
}

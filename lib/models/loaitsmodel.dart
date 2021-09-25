import 'package:amquick/all_export.dart';

class LoaiTSModel {
  String id;
  String ten;

  LoaiTSModel(
      {this.id = "0", this.ten = ""});

  factory LoaiTSModel.fromJsonOrigin(Map<String, dynamic> json) => LoaiTSModel(
      id: json["_id"].toString(),
      ten: json["ten"]
  );

  factory LoaiTSModel.fromJsonEmbeded(Map<String, dynamic> json) => LoaiTSModel(
      id: json["idloaits"].toString(),
      ten: json["ten"]
  );

  Map<String, dynamic> toJson() => {
        "idloaits": id!="" ? int.parse(id) : 0 ,
        "ten": ten
      };

  Map<String, dynamic> toJson_id() => {
    "_id":  id!="" ? int.parse(id) : 0 ,
    "ten": ten
  };
}

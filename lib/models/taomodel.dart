import 'package:amquick/all_export.dart';

class TaoModel {
  String? nguoitao;
  DateTime? tgtao;

  TaoModel({
    this.nguoitao ,
    this.tgtao
  });

  factory TaoModel.fromJson(Map<String, dynamic> json) => TaoModel(
      nguoitao: json["nguoitao"],
      tgtao: json["tgtao"]
  );

  Map<String, dynamic> toJson() => {
        "nguoitao": nguoitao,
        "tgtao": tgtao
      };
}

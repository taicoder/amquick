import 'package:amquick/all_export.dart';

class SuaDoiModel {
  String? nguoisua;
  String? tgsua;

  SuaDoiModel({
    this.nguoisua ,
    this.tgsua
  });

  factory SuaDoiModel.fromJson(Map<String, dynamic> json) => SuaDoiModel(
      nguoisua: json["nguoisua"],
      tgsua: convertStringDateTimeFromTimestamp(json["tgsua"])
  );

  Map<String, dynamic> toJson() => {
        "nguoisua": nguoisua,
        "tgsua": tgsua
      };
}

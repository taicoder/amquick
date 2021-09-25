import 'package:amquick/all_export.dart';

class ThanhLyModel {
  DateTime? ngaythanhly;
  String? nguoithanhly;

  ThanhLyModel({this.ngaythanhly , this.nguoithanhly });

  factory ThanhLyModel.fromJson(Map<String, dynamic> json) => ThanhLyModel(
      ngaythanhly: DateTime.parse(json["ngaythanhly"]),
      nguoithanhly: json["nguoithanhly"]
  );
  Map<String, dynamic> toJson() => {
        "ngaythanhly": convertStringDateFromDateTime(ngaythanhly),
        "nguoithanhly": nguoithanhly
      };
}

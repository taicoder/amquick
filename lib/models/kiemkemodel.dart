import 'package:amquick/all_export.dart';

class KiemKeModel {
  int nam;
  String tinhtrang;

  KiemKeModel(
      {this.nam = 0, this.tinhtrang = ""});

  factory KiemKeModel.fromJson(Map<String, dynamic> json) => KiemKeModel(
      nam: json["nam"],
      tinhtrang: json["tinhtrang"]
  );


  Map<String, dynamic> toJson() => {
        "nam": nam ,
        "tinhtrang": tinhtrang
      };

}

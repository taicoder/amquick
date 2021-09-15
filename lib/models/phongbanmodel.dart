class PhongBanModel {
  String idpb;
  String tenpb;

  PhongBanModel({this.idpb = "0", this.tenpb = ""});

  factory PhongBanModel.fromJson(Map<String, dynamic> json) => PhongBanModel(
      idpb: json["idpb"],
      tenpb: json["tenpb"]);
}

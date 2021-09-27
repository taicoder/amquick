import 'package:amquick/all_export.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin AssetApi on BaseApi {
  //Danh mục
  Future<bool> categrories() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token").toString();
      const url = '/asset/categrories';
      var response = await dio.post(url, data: {},  options: Options(headers: {"auth-token": token}));
      assetController.listCategories=[LoaiTSModel(id: "0", ten:"Tất cả")];
      if (response.data["success"] == "OK") {
        assetController.listCategories.addAll((response.data["results"] as List).map((e) => LoaiTSModel.fromJsonOrigin(e)).toList());
      }
      return true;
    } catch (e) {
      globalController.error = e.toString();
      return false;
    }
  }

  Future<bool> phongban() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token").toString();
      const url = '/danhmuc/phongban';
      var response = await dio.post(url, data: {},  options: Options(headers: {"auth-token": token}));
      assetController.listPhongBan=[];
      if (response.data["success"] == "OK") {
        assetController.listPhongBan.addAll((response.data["results"] as List).map((e) => PhongBanModel.fromJson(e)).toList());
      }
      return true;
    } catch (e) {
      globalController.error = e.toString();
      return false;
    }
  }

  Future<bool> asset() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token").toString();
      const url = '/asset/taisan';
      var response = await dio.post(url, data: {},  options: Options(headers: {"auth-token": token}));
      assetController.listAssets=[];
      if (response.data["success"] == "OK") {
        assetController.listAssets.addAll((response.data["results"] as List).map((e) => TaiSanModel.fromJson(e)).toList());
      }
      return true;
    } catch (e) {
      globalController.error = e.toString();
      return false;
    }
  }

  Future<bool> updateasset() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token").toString();
      var url = '/asset/capnhattaisan';

      if(assetController.myupdate==false){
        url = '/asset/themmoitaisan';
        assetController.taisan.luanchuyen = null;
        assetController.taisan.kiemke = [];
        assetController.taisan.kiemke!.add(KiemKeModel(nam: globalController.year,tinhtrang: "Bình thường"));

        assetController.taisan.thanhly = null;
      }

      assetController.taisan.ten=assetController.tenController.text;
      assetController.taisan.gia = assetController.giaController.text =="" ? 0 : convertToNum(assetController.giaController.text) as double;
      assetController.taisan.loaits= assetController.listCategories.where((element) => element.ten==assetController.loaitsController.text).first ;
      assetController.taisan.mota=assetController.motaController.text;

    //  add luân chuyển
      if(assetController.phongbanController.text.trim()!=""
        && assetController.ngaychuyenController.text.trim()!=""
          && assetController.nguoinhanController.text.trim()!=""
      ){
        assetController.taisan.luanchuyen ??= [];
        PhongBanModel phongban= assetController.listPhongBan.where((x)=>x.tenpb==assetController.phongbanController.text).first;
        print(phongban.toJson());
        assetController.taisan.luanchuyen!.add(LuanChuyenModel(phongban: phongban,ngaychuyen:convertToDate(assetController.ngaychuyenController.text),nguoinhan: assetController.nguoinhanController.text.trim()));
        assetController.taisan.luanchuyen!.sort((a,b) => b.ngaychuyen!.compareTo(a.ngaychuyen!));
      }

      final data = {
        "taisan":  assetController.taisan.toJson(),
        "hoten":  globalController.hoten
      };

      var response = await dio.post(url, data: data,  options: Options(headers: {"auth-token": token}));
      if (response.data["success"] == "OK") {
        await asset();
        if(assetController.myupdate==false) {
          assetController.setUpdateFormAsset(TaiSanModel.fromJson(response.data["results"]));
        }
      }
      return true;
    } catch (e) {
     // print(e.toString());
      globalController.error = "updateasset: "+e.toString();
      return false;
    }
  }

  Future<bool> kiemke(TaiSanModel taiSanModel) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token").toString();
      var url = '/asset/capnhattaisan';

      final data = {
        "taisan":  taiSanModel.toJson(),
        "hoten":globalController.hoten
      };

      var response = await dio.post(url, data: data,  options: Options(headers: {"auth-token": token}));
      if (response.data["success"] == "OK") {
        await asset();
        assetController.setUpdateFormAsset(taiSanModel);
      }
      return true;
    } catch (e) {
      globalController.error = "kiemke: "+e.toString();
      return false;
    }
  }

  Future<bool> thanhlytaisan(TaiSanModel taiSanModel) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token").toString();
      var url = '/asset/capnhattaisan';

      final data = {
        "taisan":  taiSanModel.toJson(),
        "hoten":globalController.hoten
      };
      var response = await dio.post(url, data: data,  options: Options(headers: {"auth-token": token}));
      if (response.data["success"] == "OK") {
        await asset();
        if(assetController.listAssets.isNotEmpty) {
          assetController.setUpdateFormAsset(assetController.listAssets.first);
        }
      }
      return true;
    } catch (e) {
      globalController.error = "thanhlytaisan: "+e.toString();
      return false;
    }
  }

  Future<bool> uploadhinhanhtaisan(TaiSanModel taiSanModel, Uint8List bytes, String nameimage) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token").toString();
      var url = '/image/upload';

      final data = {
        "idtaisan":  taiSanModel.id.toString(),
        "hinhanh":  base64Encode(bytes),
        "nameimage": nameimage
      };

      var response = await dio.post(url, data: data,  options: Options(headers: {"auth-token": token}));

      if (response.data["success"] == "OK") {
        await asset();
        assetController.setUpdateFormAsset(taiSanModel);
      }
      return true;
    } catch (e) {
      // print(e.toString());
      globalController.error = "uploadhinhanhtaisan: "+e.toString();
      return false;
    }
  }

  // Future<bool> uploadhinhanhtaisan(TaiSanModel taiSanModel) async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     String token = prefs.getString("token").toString();
  //     var url = '/asset/capnhattaisan';
  //
  //     final data = {
  //       "taisan":  taiSanModel.toJson(),
  //       "hoten":  globalController.hoten
  //     };
  //
  //     var response = await dio.post(url, data: data,  options: Options(headers: {"auth-token": token}));
  //
  //     if (response.data["success"] == "OK") {
  //       await asset();
  //      // assetController.setUpdateFormAsset(taiSanModel);
  //     }
  //     return true;
  //   } catch (e) {
  //     // print(e.toString());
  //     globalController.error = "uploadhinhanhtaisan: "+e.toString();
  //     return false;
  //   }
  // }


}

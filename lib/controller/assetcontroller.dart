import 'package:amquick/all_export.dart';
// import 'package:image/image.dart' as IMG;

class AssetController extends GetxController {
  RxBool _processing = false.obs;
  bool get processing => _processing.value;

  //Xóa sửa
  RxBool _myupdate = false.obs;
  bool get myupdate => _myupdate.value;


  //Upload image
  RxBool _uploadimage = false.obs;
  bool get uploadimage => _uploadimage.value;

  //Tài sản
  TaiSanModel taisan = TaiSanModel();

  //Xóa sửa
  RxString _tinhtrangtaisan = "Bình thường".obs;
  String get tinhtrangtaisan => _tinhtrangtaisan.value;

  void settinhtrangtaisan(String value){
    _tinhtrangtaisan.value=value;
  }

  //
  List<LoaiTSModel> listCategories=[];
  List<TaiSanModel> listAssets=[];
  List<TaiSanModel> listAssetsFilterd=[];
  final searchController = TextEditingController();
  int selectedIndex = 0;

  //Edit Asset
  final tenController = TextEditingController();
  final giaController = TextEditingController();
  final motaController = TextEditingController();
  final loaitsController = TextEditingController();
  final searchLoaiTSController= TextEditingController();

  final DateTime selectedDate = DateTime.now().add(const Duration(days: -60));
  final ngaychuyenController= TextEditingController();
  final nguoinhanController= TextEditingController();
  final phongbanController= TextEditingController();

  //Search Loại tài sản
  List<LoaiTSModel> listSearchCategories=[];

  //
  List<PhongBanModel> listPhongBan=[];
  List<PhongBanModel> listSearchPhongBan=[];
  final searchPhongBanController= TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getAll() async{
    selectedIndex=0;
    getCategories();
    getAsset();
  }

  Future<void> getCategories() async {
     var result = await api.categrories();
     _processing.value=true;
    if(result){
      _processing.value=false;
    }else{
      globalController.errorToast(globalController.error);
      _processing.value=false;
    }
  }

  Future<void> getAsset() async {
   var result = await api.asset();
    _processing.value=true;
    if(result){
       _processing.value=false;
    }else{
      _processing.value=false;
      globalController.errorToast(globalController.error);
    }

  }

  Future<void> getAssetFromCategorie(String id) async {
    var result = await api.asset();
    _processing.value=true;
    if(result){
      _processing.value=false;
      id=="0"? listAssets :
      listAssets=  listAssets.where((x) => x.loaits!.id==id).toList();
    }else{
      globalController.errorToast(globalController.error);
      _processing.value=false;
    }
  }

  Future<void> getAssetSearch() async {
    var result = await api.asset();
    _processing.value=true;
    if(result){
      _processing.value=false;
      searchController.text==""? listAssets :
      listAssets=  listAssets.where((x) => x.ten.toString().toLowerCase().contains(searchController.text) || TiengViet.parse(x.ten.toLowerCase()).contains(searchController.text.toLowerCase())).toList();
    }else{
      globalController.errorToast(globalController.error);
      _processing.value=false;
    }
  }

  Future<void> setUpdateFormAsset(TaiSanModel taiSanModel) async  {
    try {
      _myupdate.value = true;
      tenController.text = "";
      giaController.text = "";
      motaController.text = "";
      loaitsController.text = "";

      phongbanController.text = "";
      ngaychuyenController.text = "";
      nguoinhanController.text = "";

      taisan=taiSanModel;
      if(taisan.luanchuyen!=null) {
        taisan.luanchuyen!.sort((a, b) => b.ngaychuyen!.compareTo(a.ngaychuyen!));
      }
      listSearchCategories=listCategories;
      tenController.text = taiSanModel.ten;
      giaController.text = convertVND(taiSanModel.gia);
      loaitsController.text = taiSanModel.loaits!.ten;
      motaController.text = taiSanModel.mota;
    }
    catch(e){
      globalController.errorToast("setUpdateFormAsset: "+e.toString());
    }

  }

  Future<void> setInsertFormAsset() async  {
    _myupdate.value=false;

    tenController.text= "";
    giaController.text= "";
    motaController.text= "";
    loaitsController.text= "";
  }

  Future<void> searchLoaiTaiSan() async  {
    _processing.value=true;
    try{
      _processing.value=false;
      listSearchCategories=listCategories;
      if(searchLoaiTSController.text.trim()!="") {
        listSearchCategories= listSearchCategories.where((element) =>
            element.ten.toLowerCase().contains(searchLoaiTSController.text.toLowerCase())
            || TiengViet.parse(element.ten.toLowerCase()).contains(TiengViet.parse(searchLoaiTSController.text.toLowerCase()))
        ).toList();
      }
    }catch(e){
      globalController.errorToast("searchLoaiTaiSan: "+e.toString());
    }
  }

  Future<void> updateasset() async {
    _processing.value=true;
    var result = await api.updateasset();
    if(result){
      _processing.value=false;
      globalController.successToast("Thành công");
    }else{
      globalController.errorToast(globalController.error);
      _processing.value=false;
    }
  }


  Future<void> getPhongBan() async {
    var result = await api.phongban();
    _processing.value=true;
    if(result){
      _processing.value=false;
      listSearchPhongBan=[];
      listSearchPhongBan.addAll(listPhongBan);
    }else{
      globalController.errorToast(globalController.error);
      _processing.value=false;
    }
  }

  Future<void> searchPhongBan() async{
    _processing.value=true;
    try{
      _processing.value=false;
      listSearchPhongBan=listPhongBan;
      if(searchPhongBanController.text.trim()!="") {
        listSearchPhongBan= listSearchPhongBan.where((element) =>
        element.tenpb.toLowerCase().contains(searchPhongBanController.text.toLowerCase())
            || TiengViet.parse(element.tenpb.toLowerCase()).contains(TiengViet.parse(searchPhongBanController.text.toLowerCase()))
        ).toList();
      }
    }catch(e){
      globalController.errorToast("searchPhongBan: "+e.toString());
    }
  }

  Future<void> KiemKe(String tinhtrang) async {
    _processing.value=true;
      KiemKeModel kiemKeModel = KiemKeModel(nam: globalController.year,tinhtrang:tinhtrang);
      try{
         taisan.kiemke!.removeWhere((element) => element.nam==globalController.year);
      }catch(e){}
      taisan.kiemke ??= [];
      taisan.kiemke!.add(kiemKeModel);
    _processing.value=false;
     var result = await api.kiemke(taisan);
      if(result){
        globalController.successToast("Thành công");
      }else {
        globalController.errorToast(globalController.error);
      }
  }

  Future<void> HuyKiemKe(String tinhtrang) async{
    _processing.value=true;
    try{
      taisan.kiemke!.removeWhere((element) => element.nam==globalController.year);
      if(taisan.kiemke!=null) if(taisan.kiemke!.isEmpty) taisan.kiemke=null;
    }catch(e){}
    _processing.value=false;
    var result = await api.kiemke(taisan);
    if(result){
      globalController.successToast("Đã hủy");
    }else {
      globalController.errorToast(globalController.error);
    }
  }

  Future<void> deleteLuanChuyen(LuanChuyenModel luanChuyenModel) async {
    Get.defaultDialog(
        title: "",
        content: Text("Bạn có thực sự muốn xóa?", style: TextStyle(fontSize: ThemeConfig.headerSize)),
        confirm: TextButton(
          child: Text("Đồng ý",style: TextStyle(fontSize: ThemeConfig.titleSize)),
          onPressed: () async {
            _processing.value=true;
            try {
              _processing.value=false;

              assetController.phongbanController.text="";
              assetController.ngaychuyenController.text="";
              assetController.nguoinhanController.text="";

              taisan.luanchuyen!.remove(luanChuyenModel);
              setUpdateFormAsset(taisan);
              updateasset();
              Get.back();
              //  globalController.successToast("Thành công");
            }catch(e){
              globalController.errorToast(e.toString());
            }

          },
        ),
        cancel: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: TextButton(
            child: Text("Hủy", style: TextStyle(fontSize: ThemeConfig.titleSize),),
            onPressed: () {
            Get.back();
            },
            ),
            ));
  }

  Future<void> thanhLyTaiSan() async {
    Get.defaultDialog(
        title: "",
        content: Text("Bạn có thực sự muốn thanh lý?", style: TextStyle(fontSize: ThemeConfig.headerSize),),
        confirm: TextButton(
          child: Text("Đồng ý",style: TextStyle(fontSize: ThemeConfig.titleSize),),
          onPressed: () async {
            _processing.value=true;
            try {
              taisan.thanhly=ThanhLyModel(ngaythanhly: DateTime.now(),nguoithanhly: globalController.hoten ) ;
              await api.thanhlytaisan(taisan);
              Get.back();
              globalController.successToast("Thành công");
              _processing.value=false;
            }catch(e){
              globalController.errorToast(e.toString());
            }

          },
        ),
        cancel: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: TextButton(
            child: Text("Hủy", style: TextStyle(fontSize: ThemeConfig.titleSize),),
            onPressed: () {
              Get.back();
            },
          ),
        ));
  }

  Future<void> getMyImage(String source) async {
    try{
      double maxWidth = 500;
      double maxHeight = 500;
      int quality = 100;

      final image=  await ImagePicker().pickImage(
          source: source=="camera" ? ImageSource.camera : ImageSource.gallery,
          // maxWidth: maxWidth,
          // maxHeight: maxHeight,
          // imageQuality: quality
      );
      final bytes = await image?.readAsBytes() as Uint8List;
    //  IMG.Image? img = IMG.decodeImage(bytes.le);
    //   print(bytes.lengthInBytes/1024);  //kb
      // print(img?.height);

    //  String base64= base64Encode(bytes);
      taisan.hinhanh?.clear();
      if(taisan.hinhanh==null){
        taisan.hinhanh=[];
      }
      taisan.hinhanh?.add(image!.name);
      await saveImage(bytes, image!.name);

    }catch(e){
      print(e.toString());
    }

  }

  Future<void> saveImage(Uint8List bytes, String nameimage) async {
    _uploadimage.value=true;
    var result = await api.uploadhinhanhtaisan(taisan, bytes, nameimage);
    if(result){
      _uploadimage.value=false;
       globalController.successToast("Thành công");
    }else{
      globalController.errorToast(globalController.error);
    }

  }

  // Future<void> saveImage(String base64) async {
  //   _uploadimage.value=true;
  //   taisan.hinhanh?.clear();
  //   if(taisan.hinhanh==null){
  //     taisan.hinhanh=[];
  //   }
  //   taisan.hinhanh?.add(base64);
  //   _uploadimage.value=false;
  //   globalController.successToast("Thành công");
  //   assetController.setUpdateFormAsset(taisan);
  //   var result = await api.uploadhinhanhtaisan(taisan);
  //   if(result){
  //    // globalController.successToast("Thành công");
  //   }else{
  //     globalController.errorToast(globalController.error);
  //   }
  //
  // }

}

final AssetController assetController =
    Get.put(AssetController(), permanent: true);

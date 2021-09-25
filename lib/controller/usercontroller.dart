import 'package:amquick/all_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  RxBool _processing = false.obs;
  bool get processing => _processing.value;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final old_passwordController = TextEditingController();
  final new_passwordController = TextEditingController();
  final nameController = TextEditingController();
  final departmentController = TextEditingController();
  UserModel userModel=UserModel();

  RxBool _obscureText1 = true.obs;
  bool get obscureText1 => _obscureText1.value;

  RxBool _obscureText2 = true.obs;
  bool get obscureText2 => _obscureText2.value;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> toInfor() async {
    userController.nameController.text=globalController.hoten;
    userController.departmentController.text= globalController.tenphongban;
    await Get.to(() => const Infor());
  }

  Future<void> toChangePass() async {
    userController.old_passwordController.text="";
    userController.new_passwordController.text="";
    await Get.to(() => const ChangePass());
  }

  Future<void> login(BuildContext context) async {
    if(phoneController.text.trim()!="" && passwordController.text.trim()!=""){
      _processing.value=true;
      var result = await api.login(user:phoneController.text, password:passwordController.text);
      if(result){
        _processing.value=false;
        Navigator.pop(context);
        Navigator.pushNamed(context, "/index");

        //get all
        assetController.getAll();
      }else{
        globalController.errorToast(globalController.error);
        _processing.value=false;
      }
    }
  }

  Future<void> getUser() async {
    try{
      _processing.value=true;
      var result = await api.getUser();
      _processing.value=false;
    }catch(e){
      _processing.value=false;
      globalController.errorToast(e.toString());
    }
  }

  Future<void> logout(BuildContext context) async {
    _processing.value=true;
    try{
      _processing.value=false;

      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.clear();
      userController.phoneController.text="";
      userController.passwordController.text="";
      Navigator.pop(context);
      Navigator.pushNamed(context, "/login");

    }catch(ex){
      globalController.errorToast(ex.toString());
      _processing.value=false;
    }
  }

  Future<void> updateUser() async {
    if(nameController.text.trim()!="" && departmentController.text.trim()!=""){
      _processing.value=true;
      try{
        await assetController.getPhongBan();
        await getUser();
        PhongBanModel phongban = assetController.listPhongBan.where((element) => element.tenpb==departmentController.text).first;
        userModel.hoten=nameController.text;
        userModel.phongban=phongban;
        var result = await api.updateuser(userModel);
         if(result){
           _processing.value=false;
           globalController.userSharedPreferencesNoToken(userModel);
           globalController.successToast("Thành công");
         }else{
           globalController.errorToast(globalController.error);
         }

      }catch(e){
        _processing.value=false;
        globalController.errorToast(e.toString());
      }


    }
   }

  Future<void> changePass() async {
    if(old_passwordController.text.trim()!="" && new_passwordController.text.trim()!=""){
      await getUser();
      if(old_passwordController.text.trim()==userModel.matkhau){
        _processing.value=true;
        try{
          userModel.matkhau=new_passwordController.text.trim();
          var result = await api.updateuser(userModel);
          if(result){
            _processing.value=false;
            globalController.successToast("Thành công");
          }else{
            globalController.errorToast(globalController.error);
          }
        }catch(e){
          _processing.value=false;
          globalController.errorToast(e.toString());
        }
      }else{
        globalController.errorToast("Mật khẩu hiện tại không đúng");
      }
    }
  }

  Future<void> set_obscureText1() async {
    _obscureText1.value=!_obscureText1.value;
  }

  Future<void> set_obscureText2() async {
    _obscureText2.value=!_obscureText2.value;
  }

}

final UserController userController =
Get.put(UserController(), permanent: true);


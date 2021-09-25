import 'package:amquick/all_export.dart';
import 'package:amquick/controller/usercontroller.dart';

class ChangePass extends StatelessWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.backgroundColor,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)) ,
        backgroundColor: ThemeConfig.blueColor,
        title:  const Text("Đổi mật khẩu"),
      ),

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

//Mật khẩu hiện tại
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 16),
                child: RichText(
                  text:  TextSpan(
                      children: <TextSpan> [
                        TextSpan(text: "Mật khẩu hiện tại", style: TextStyle(color: ThemeConfig.blackColor, fontFamily: "Quicksand", fontSize: ThemeConfig.defaultSize)),
                      ]
                  ) ,
                ) ,
              ),
              Padding(
                padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
                child: Obx(()=>TextFormField(
                  style:  TextStyle(fontSize: ThemeConfig.titleSize),
                  obscureText: userController.obscureText1,
                  controller: userController.old_passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: (){
                        userController.set_obscureText1();
                      },
                      icon: userController.obscureText1 ? const Icon(Icons.visibility_off, color:Colors.grey, size:20) : const Icon(Icons.visibility_rounded, color:Colors.grey, size:20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    isDense: true, // important line
                    contentPadding: const EdgeInsets.fromLTRB(
                        10, 10, 20, 20), // control your hints text size
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                )),
              ),

//Mật khẩu mới
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 16),
                child: RichText(
                  text:  TextSpan(
                      children: <TextSpan> [
                        TextSpan(text: "Mật khẩu mới", style: TextStyle(color: ThemeConfig.blackColor, fontFamily: "Quicksand", fontSize: ThemeConfig.defaultSize)),
                      ]
                  ) ,
                ) ,
              ),
              Padding(
                padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
                child: Obx(()=>TextFormField(
                  style:  TextStyle(fontSize: ThemeConfig.titleSize),
                  obscureText: userController.obscureText2,
                  controller: userController.new_passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: (){
                        userController.set_obscureText2();
                      },
                      icon: userController.obscureText2 ? const Icon(Icons.visibility_off, color:Colors.grey, size:20) : const Icon(Icons.visibility_rounded, color:Colors.grey, size:20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    isDense: true, // important line
                    contentPadding: const EdgeInsets.fromLTRB(
                        10, 10, 20, 20), // control your hints text size
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                )),
              ),


              const SizedBox(height: 30),

//Nút lưu
              Center(
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      await userController.changePass();
                    },
                    child: Obx(()=> userController.processing ? SizedBox(height: 20, width: 20,child: CircularProgressIndicator(strokeWidth: 2,),): Text("Lưu",style: TextStyle(fontSize: ThemeConfig.titleSize)))  ,
                    style: ElevatedButton.styleFrom(
                      primary: ThemeConfig.blueColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                ),
              ),




            ],
          ),
        ) ,
      ),
    ) ;
  }
}

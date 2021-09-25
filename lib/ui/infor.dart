import 'package:amquick/all_export.dart';
import 'package:amquick/controller/usercontroller.dart';

class Infor extends StatelessWidget {
  const Infor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.backgroundColor,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)) ,
        backgroundColor: ThemeConfig.blueColor,
        title:  const Text("Đổi thông tin"),
      ),

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

//Tên
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 16),
                child: RichText(
                  text:  TextSpan(
                      children: <TextSpan> [
                        TextSpan(text: "Họ và tên", style: TextStyle(color: ThemeConfig.blackColor, fontFamily: "Quicksand", fontSize: ThemeConfig.defaultSize)),
                      ]
                  ) ,
                ) ,
              ),
              Padding(
                padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
                child: TextFormField(
                  style:  TextStyle(fontSize: ThemeConfig.titleSize),
                  controller: userController.nameController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: userController.nameController.clear,
                      icon: Icon(Icons.clear, color:Colors.grey, size:20),
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
                ),
              ),


//Phòng ban
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:  const EdgeInsets.only(left: 16),
                child: RichText(
                  text:  TextSpan(
                      children: <TextSpan> [
                        TextSpan(text: "Phòng ban", style: TextStyle(color: ThemeConfig.blackColor, fontFamily: "Quicksand", fontSize: ThemeConfig.defaultSize)),
                      ]
                  ) ,
                ) ,
              ),
              Padding(
                padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 30),
                  child: TextFormField(
                    style:  TextStyle(fontSize: ThemeConfig.titleSize),
                    readOnly: true,
                    onTap: () {
                      assetController.getPhongBan();
                      myModalBottomSheetPhongBan(context,userController.departmentController);
                    },
                    controller: userController.departmentController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey,),
                      suffixIcon: IconButton(
                        onPressed: userController.departmentController.clear,
                        icon: const Icon(Icons.clear, color:Colors.grey, size:20),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      isDense: true, // important line
                      contentPadding: const EdgeInsets.fromLTRB(
                          10, 10, 20, 10), // control your hints text size
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 30),

//Nút lưu
              Center(
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                        await userController.updateUser();
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

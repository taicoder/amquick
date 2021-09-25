import 'package:amquick/all_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AssetEdit extends StatefulWidget {
  final TaiSanModel taiSanModel;
  const AssetEdit({Key? key, required this.taiSanModel}) : super(key: key);
  @override
  _AssetEditState createState() => _AssetEditState();
}

class _AssetEditState extends State<AssetEdit> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ThemeConfig.blueColor,
        title:  Obx(()=>assetController.myupdate ==false ? const Text("Thêm mới tài sản") : const Text("Sửa đổi thông tin tài sản")) ,
        actions: [
          IconButton(onPressed: (){
            assetController.setInsertFormAsset();
          }, icon: const Icon(Icons.add) )
        ],
      ),
      bottomNavigationBar: Container(
        color: ThemeConfig.backgroundColor,
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

//Nút Hủy
            SizedBox(
              height: 30,
              width: 100,
              child: OutlinedButton(onPressed: () {
                Navigator.pop(context);
              },
                child:  Text("Hủy", style: TextStyle(color: Colors.black,fontSize: ThemeConfig.titleSize)), style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1, color: Colors.grey),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                  ),
                ),
              ),
            ),


//Nút Lưu
            SizedBox(
              height: 30,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    assetController.updateasset();
                  }
                },
                child: Obx(()=> assetController.processing ? SizedBox(height: 20, width: 20,child: CircularProgressIndicator(strokeWidth: 2,),): Text("Lưu",style: TextStyle(fontSize: ThemeConfig.titleSize)))  ,
                style: ElevatedButton.styleFrom(
                  primary: ThemeConfig.blueColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [

//Tên
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 16),
                      child: RichText(
                        text:  TextSpan(
                            children: <TextSpan> [
                              TextSpan(text: "Tên", style: TextStyle(color: ThemeConfig.blackColor, fontFamily: "Quicksand", fontSize: ThemeConfig.defaultSize)),
                              TextSpan(text: " (*)", style: TextStyle(color: ThemeConfig.redColor, fontFamily: "Quicksand", fontSize: ThemeConfig.defaultSize)),
                            ]
                        ) ,
                      ) ,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
                      child: TextFormField(
                        style:  TextStyle(fontSize: ThemeConfig.titleSize),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Không được để trống';
                          }
                          return null;
                        },
                        controller: assetController.tenController,
                        decoration: InputDecoration(
                          //  hintText: "Số điện thoại",
                          suffixIcon: IconButton(
                            onPressed: assetController.tenController.clear,
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

//Giá
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:  const EdgeInsets.only(left: 16),
                      child: RichText(
                        text:  TextSpan(
                            children: <TextSpan> [
                              TextSpan(text: "Giá", style: TextStyle(color: ThemeConfig.blackColor, fontFamily: "Quicksand", fontSize: ThemeConfig.defaultSize)),
                              TextSpan(text: " (*)", style: TextStyle(color: ThemeConfig.redColor, fontFamily: "Quicksand", fontSize: ThemeConfig.defaultSize)),
                            ]
                        ) ,
                      ) ,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
                      child: TextFormField(
                        style:  TextStyle(fontSize: ThemeConfig.titleSize),
                        inputFormatters: <TextInputFormatter>[CurrencyTextInputFormatter(
                          locale: 'vi',
                          decimalDigits: 0,
                          symbol: '',
                        )],
                        keyboardType: TextInputType.number,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Không được để trống';
                          }
                          return null;
                        },
                        controller: assetController.giaController,
                        decoration: InputDecoration(
                          //  hintText: "Số điện thoại",
                          suffixIcon: IconButton(
                            onPressed: assetController.giaController.clear,
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

//Loại tài sản
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:  const EdgeInsets.only(left: 16),
                      child: RichText(
                        text:  TextSpan(
                            children: <TextSpan> [
                              TextSpan(text: "Loại tài sản", style: TextStyle(color: ThemeConfig.blackColor, fontFamily: "Quicksand", fontSize: ThemeConfig.defaultSize)),
                              TextSpan(text: " (*)", style: TextStyle(color: ThemeConfig.redColor, fontFamily: "Quicksand", fontSize: ThemeConfig.defaultSize)),
                            ]
                        ) ,
                      ) ,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 30),
                        child: TextFormField(
                          style:  TextStyle(fontSize: ThemeConfig.titleSize),
                          readOnly: true,
                          onTap: () {
                            myModalBottomSheetLoaiTaiSan(context, widget.taiSanModel);
                          },
                          // keyboardType: TextInputType.number,
                          controller: assetController.loaitsController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Không được để trống';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            //  hintText: "Số điện thoại",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey,),
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

//Mô tả
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:  const EdgeInsets.only(left: 16),
                      child:  RichText(
                        text:  TextSpan(
                            children: <TextSpan> [
                              TextSpan(text: "Mô tả", style: TextStyle(color: ThemeConfig.blackColor, fontFamily: "Quicksand", fontSize: ThemeConfig.defaultSize)),
                            ]
                        ) ,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
                      child: TextFormField(
                        style:  TextStyle(fontSize: ThemeConfig.titleSize),
                      //  maxLines: 3,
                       // textInputAction: TextInputAction.newline,
                     //   keyboardType: TextInputType.multiline,
                        controller: assetController.motaController,
                        decoration: InputDecoration(
                          //  hintText: "Số điện thoại",
                          suffixIcon: IconButton(
                            onPressed: assetController.motaController.clear,
                            icon: Icon(Icons.clear, color:Colors.grey, size:20),
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

//Luân chuyển
                  Obx(()=>assetController.myupdate==true ?
                  LuanChuyen(context)
                      : Text(""))

                  ],
                ),
              ),
            ],
          ),
        ) ,
      ),
    ) ;
  }
}

Widget LuanChuyen (context) {
  return Obx(()=>Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      Row(
          children: <Widget>[
            const Expanded(
                child: Divider(thickness: 1,)
            ),
            Text("Luân chuyển tài sản", style: TextStyle(fontSize: ThemeConfig.headerSize),
            ),
            const Expanded(
                child: Divider(thickness: 1,)
            ),
          ]
      ),

      const SizedBox(
        height: 20,
      ),

//FormLuanChuyenTaiSan
     FormLuanChuyenTaiSan(context),

      const SizedBox(
        height: 15,
      ),
      assetController.processing? Text("") : Text(""),
      assetController.taisan.luanchuyen!=null ? assetController.taisan.luanchuyen!.length!=0 ? Text("") : Text("Chưa được luân chuyển", style: TextStyle(fontSize: ThemeConfig.titleSize)) : Text("Chưa được luân chuyển", style: TextStyle(fontSize: ThemeConfig.titleSize)) ,
      //Luân chuyển
      Column(
        children: assetController.taisan.luanchuyen!= null ? assetController.taisan.luanchuyen!.map((e) =>ListTile(
          onTap: (){},
          title: Text(e.phongban!.tenpb,style: TextStyle(fontSize: ThemeConfig.headerSize)),
          subtitle: Text("Người nhận: "+e.nguoinhan!,style: TextStyle(fontSize: ThemeConfig.headerSize)),
          leading: Text(e.toJsonDisplay()["ngaychuyen"],style: TextStyle(fontSize: ThemeConfig.titleSize)) ,
          trailing: IconButton(onPressed: () async{
            assetController.deleteLuanChuyen(e);
          }, icon:  Icon(Icons.delete_forever_outlined,color: Colors.red.withOpacity(0.8),)) ,
        )).toList() : [],
      ),



      const SizedBox(
        height: 200,
      ),

    ],
  )) ;
}

Widget FormLuanChuyenTaiSan(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

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
            constraints: BoxConstraints(minHeight: 30),
            child: TextFormField(
              style:  TextStyle(fontSize: ThemeConfig.titleSize),
              readOnly: true,
              onTap: () {
                assetController.getPhongBan();
                myModalBottomSheetPhongBan(context,assetController.phongbanController);
              },
              controller: assetController.phongbanController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey,),
                suffixIcon: IconButton(
                  onPressed: assetController.phongbanController.clear,
                  icon: Icon(Icons.clear, color:Colors.grey, size:20),
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

//Ngày chuyển
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding:  const EdgeInsets.only(left: 16),
          child: RichText(
            text:  TextSpan(
                children: <TextSpan> [
                  TextSpan(text: "Ngày chuyển", style: TextStyle(color: ThemeConfig.blackColor, fontFamily: "Quicksand", fontSize: ThemeConfig.defaultSize))
                ]
            ) ,
          ) ,
        ),
        Padding(
          padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 20),
            child: TextFormField(
              style:  TextStyle(fontSize: ThemeConfig.titleSize),
              readOnly: true,
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: assetController.selectedDate,
                  firstDate: DateTime(
                      assetController.selectedDate.year - 2),
                  lastDate: DateTime(
                      assetController.selectedDate.year + 1),
                  helpText: "Chọn ngày kết thúc",
                  confirmText: "Đồng ý",
                  cancelText: "Hủy",
                ).then((value) => {
                  assetController.ngaychuyenController.text =
                      DateFormat('dd/MM/yyyy').format(value ?? DateTime.now()),
                });
              },
              controller: assetController.ngaychuyenController,
              decoration: InputDecoration(
                //  hintText: "Số điện thoại",
                prefixIcon: const Icon(Icons.calendar_today_outlined) ,
                suffixIcon: IconButton(
                onPressed: assetController.ngaychuyenController.clear,
                icon: Icon(Icons.clear, color:Colors.grey, size:20),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                isDense: true, // important line
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0), // control your hints text size
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


//Người nhận
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
            text:  TextSpan(
                children: <TextSpan> [
                  TextSpan(text: "Người nhận", style: TextStyle(color: ThemeConfig.blackColor, fontFamily: "Quicksand", fontSize: ThemeConfig.defaultSize)),
                ]
            ) ,
          ) ,
        ),
        Padding(
          padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
          child: TextFormField(
            style:  TextStyle(fontSize: ThemeConfig.titleSize),
            controller: assetController.nguoinhanController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: assetController.nguoinhanController.clear,
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


        // Padding(
        //   padding:  const EdgeInsets.symmetric(horizontal: 16),
        //   child: Row(
        //     children: [
        //       Icon(Icons.info_outline, color: Colors.grey,),
        //       Text("Để lCần nhập đầy đủ thông tin luân chuyển"),
        //     ],
        //   ) ,
        // ),



      ],
    );
}

void myModalBottomSheetLoaiTaiSan(BuildContext context, TaiSanModel taiSanModel){
  showModalBottomSheet(
      isScrollControlled:true,
      backgroundColor: ThemeConfig.whiteColor,
      // constraints:  BoxConstraints(
      //   maxHeight: 700
      // ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      context: context,
      builder: (context){
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Chọn loại tài sản", style: TextStyle(fontSize: ThemeConfig.titleSize),),
            ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 250,
                    child:  TextFormField(
                      onChanged:  (value){
                        assetController.searchLoaiTaiSan();
                      },
                     // keyboardType: TextInputType.number,
                      controller: assetController.searchLoaiTSController,
                      decoration: InputDecoration(
                        hintText: "Tìm kiếm",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        isDense: true, // important line
                        contentPadding: const EdgeInsets.fromLTRB(
                            20, 10, 20, 10), // control your hints text size
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ) ,
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.close))
                ],
              ),
          ),
        ),
            Expanded(
              child: Obx(()=>!assetController.processing? ListView(
                children: ListTile.divideTiles( //          <-- ListTile.divideTiles
                  context: context,
                  tiles: assetController.listSearchCategories.map((loaits) => loaits.ten!="Tất cả" ? ListTile(
                    onTap: (){
                      assetController.loaitsController.text=loaits.ten;
                      Navigator.pop(context);
                    },
                    title: Text(loaits.ten, style: TextStyle(fontSize: ThemeConfig.titleSize)),
                    trailing: loaits.ten==taiSanModel.loaits!.ten ? Icon(Icons.check) : null ,
                  ): Text("")),
                ).toList(),
              ) : CircularProgressIndicator()) ,
            ),
          ],
        ) ,
      ),
    );

  });
}

// void myModalBottomSheetPhongBan(BuildContext context){
//   showModalBottomSheet(
//       isScrollControlled:true,
//       backgroundColor: ThemeConfig.whiteColor,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
//       ),
//       context: context,
//       builder: (context){
//         return FractionallySizedBox(
//           heightFactor: 0.95,
//           child: Container(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("Chọn Phòng ban", style: TextStyle(fontSize: ThemeConfig.titleSize),),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     height: 35,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         SizedBox(
//                           width: 250,
//                           child:  TextFormField(
//                             onChanged:  (value){
//                               assetController.searchPhongBan();
//                             },
//                             // keyboardType: TextInputType.number,
//                             controller: assetController.searchPhongBanController,
//                             decoration: InputDecoration(
//                               hintText: "Tìm kiếm",
//                               prefixIcon: const Icon(Icons.search),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               isDense: true, // important line
//                               contentPadding: const EdgeInsets.fromLTRB(
//                                   20, 10, 20, 10), // control your hints text size
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(25.0),
//                                 borderSide: BorderSide(
//                                   color: Colors.black.withOpacity(0.5),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ) ,
//                         IconButton(onPressed: (){
//                           Navigator.pop(context);
//                         }, icon: Icon(Icons.close)),
//
//
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Obx(()=>!assetController.processing? ListView(
//                     children: ListTile.divideTiles( //          <-- ListTile.divideTiles
//                       context: context,
//                       tiles: assetController.listSearchPhongBan.map((pb) => ListTile(
//                         onTap: (){
//                           assetController.phongbanController.text=pb.tenpb;
//                           Navigator.pop(context);
//                         },
//                         title: Text(pb.tenpb, style: TextStyle(fontSize: ThemeConfig.titleSize)),
//                       )),
//                     ).toList(),
//                   ) : CircularProgressIndicator()) ,
//                 ),
//
//               ],
//             ) ,
//           ),
//         );
//
//       });
// }


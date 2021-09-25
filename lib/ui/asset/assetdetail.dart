import 'package:amquick/all_export.dart';

const kTileHeight = 60.0;
class AssetDetail extends StatelessWidget {
 // final TaiSanModel taiSanModel;
  // const AssetDetail({Key? key,required this.taiSanModel}) : super(key: key);
  const AssetDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Obx(() => Scaffold(
      backgroundColor: ThemeConfig.backgroundColor,
      bottomNavigationBar: Container(
        color: ThemeConfig.backgroundColor,
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

//Nút Kiểm kê
            SizedBox(
              height: 30,
              width: 100,
              child: OutlinedButton(onPressed: () {
                myModalBottomSheetTinhTrangTaiSan(context);
              },
                child:  Text("Kiểm kê", style: TextStyle(color: Colors.black,fontSize: ThemeConfig.titleSize)), style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1, color: Colors.grey),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                  ),
                ),
              ),
            ),


//Nút Thanh lý
            SizedBox(
              height: 30,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  assetController.thanhLyTaiSan();
                },
                child: Obx(()=> assetController.processing ? const SizedBox(height: 20, width: 20,child: CircularProgressIndicator(strokeWidth: 2,),): Text("Thanh lý",style: TextStyle(fontSize: ThemeConfig.titleSize)))  ,
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
      body: GestureDetector(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              snap: true,
              floating: true,
              leading: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back_ios)) ,
              actions: [
                IconButton(
                  icon:const Icon(Icons.more_vert, color: Colors.white) ,
                  onPressed: () async {
                    await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AssetEdit(taiSanModel: assetController.taisan,)));
                    assetController.setUpdateFormAsset(assetController.taisan);
                  },
                ) ,
              ],
              backgroundColor: ThemeConfig.backgroundColor,
              expandedHeight: 200,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(0)),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                    ),
                    child: Image.asset(
                      "assets/images/3.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        assetController.taisan.ten,
                        style:  TextStyle(
                            fontWeight: FontWeight.bold, fontSize: ThemeConfig.headerSize
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Obx(()=>Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        assetController.taisan.kiemke!=null ?  assetController.taisan.kiemke!.where((x)=>x.nam==globalController.year).isNotEmpty ? const Icon(Icons.check_circle_outline, color: Colors.green,size: 30,) :const Icon(Icons.check_circle_outline, color: Colors.grey,size: 30,) : const Icon(Icons.check_circle_outline, color: Colors.grey,size: 30,),
                        assetController.taisan.kiemke!=null ?  assetController.taisan.kiemke!.where((x)=>x.nam==globalController.year).isNotEmpty ?  Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text("Đã kiểm kê",  style: TextStyle(fontSize: ThemeConfig.titleSize)),
                        ) : Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text("Chưa kiểm kê",  style: TextStyle(fontSize: ThemeConfig.titleSize)),
                        ) :  Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text("Chưa kiểm kê",  style: TextStyle(fontSize: ThemeConfig.titleSize)),
                        ),
                        assetController.processing ? Text("") : Text("")
                      ],
                    )),
                  ),


 //Phòng ban
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const  EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Phòng ban",
                      style: TextStyle(
                          color: ThemeConfig.blueColor,
                          fontSize: ThemeConfig.headerSize
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Text(
                        assetController.taisan.luanchuyen!=null ? assetController.taisan.luanchuyen!.length==0 ? "[Chưa luân chuyển]" :  assetController.taisan.luanchuyen![0].phongban!.tenpb : "[Chưa luân chuyển]",
                        maxLines: 5,
                        style: TextStyle(
                            fontSize: ThemeConfig.titleSize
                        ),
                      ),
                    ),
                  ),


 //Loại tài sản
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Loại tài sản",
                      style: TextStyle(
                          color: ThemeConfig.blueColor, fontSize: ThemeConfig.headerSize
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Text(
                        assetController.taisan.loaits!.ten,
                        style: TextStyle(
                            fontSize: ThemeConfig.titleSize
                        ),
                      ),
                    ),
                  ),


//Giá
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Giá",
                      style: TextStyle(
                          color: ThemeConfig.blueColor,
                          fontSize: ThemeConfig.headerSize
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Text(
                          convertVND(assetController.taisan.gia)+" VNĐ",
                          style: TextStyle(
                              fontSize: ThemeConfig.titleSize
                          )
                      ),
                    ),
                  ),


//Mô tả
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const  EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Mô tả",
                      style: TextStyle(
                          color: ThemeConfig.blueColor,
                          fontSize: ThemeConfig.headerSize
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Text(
                        assetController.taisan.mota.trim() != "" ? assetController.taisan.mota : "[Chưa có thông tin]",
                        maxLines: 5,
                        style: TextStyle(
                            fontSize: ThemeConfig.titleSize
                        ),
                      ),
                    ),
                  ),

//Tình trạng
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const  EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Tình trạng",
                      style: TextStyle(
                          color: ThemeConfig.blueColor,
                          fontSize: ThemeConfig.headerSize
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Text(
                        assetController.taisan.kiemke!=null ?  assetController.taisan.kiemke!.where((x)=>x.nam==globalController.year).isNotEmpty ? assetController.taisan.kiemke!.where((element) => element.nam==globalController.year).first.tinhtrang : "[Chưa kiểm kê]" : "[Chưa kiểm kê]",
                        maxLines: 5,
                        style: TextStyle(
                            fontSize: ThemeConfig.titleSize
                        ),
                      ),
                    ),
                  ),


//Quá trình luân chuyển
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const  EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Quá trình luân chuyển",
                      style: TextStyle(
                          color: ThemeConfig.blueColor,
                          fontSize: ThemeConfig.headerSize
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: assetController.taisan.luanchuyen!=null ? assetController.taisan.luanchuyen!.length!=0 ? Text("") : Text("Chưa được luân chuyển", style: TextStyle(fontSize: ThemeConfig.titleSize)) : Text("Chưa được luân chuyển", style: TextStyle(fontSize: ThemeConfig.titleSize)),
                    ),
                  ),
                  Column(
                    children: assetController.taisan.luanchuyen!= null ? assetController.taisan.luanchuyen!.map((e) =>ListTile(
                      onTap: (){},
                      title: Text(e.phongban!.tenpb,style: TextStyle(fontSize: ThemeConfig.headerSize)),
                      subtitle: Text("Người nhận: "+e.nguoinhan!,style: TextStyle(fontSize: ThemeConfig.headerSize)),
                      leading: Text(e.toJsonDisplay()["ngaychuyen"],style: TextStyle(fontSize: ThemeConfig.titleSize)) ,
                    )).toList() : [],
                  ),



                  assetController.processing ? const Text("") : const Text("")

                ],
              ),
            ),
          ],
        ),
      ),

    )) ;
  }
}

void myModalBottomSheetTinhTrangTaiSan(BuildContext context){
  showModalBottomSheet(
      isScrollControlled:true,
      backgroundColor: ThemeConfig.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      context: context,
      builder: (context){
        return FractionallySizedBox(
          heightFactor: 0.95,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Text("Kiểm kê năm "+globalController.year.toString(), style: TextStyle(color: ThemeConfig.blackColor, fontFamily: "Quicksand", fontSize: ThemeConfig.headerSize)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Text("Chọn tình trạng tài sản", style: TextStyle(color: ThemeConfig.blackColor, fontFamily: "Quicksand", fontSize: ThemeConfig.titleSize)),
                ),
                const SizedBox(height:30),
                Expanded(
                  child: ListView(
                    children: ListTile.divideTiles( //          <-- ListTile.divideTiles
                      context: context,
                      tiles: ["Hủy kiểm kê","Bình thường", "Hỏng hóc đang sửa chữa"].map((item) => ListTile(
                        onTap: (){
                          item=="Hủy kiểm kê" ? assetController.HuyKiemKe(item) : assetController.KiemKe(item);
                          Navigator.pop(context);
                        },
                        title: item=="Hủy kiểm kê" ? Text(item, style: TextStyle(fontSize: ThemeConfig.titleSize, color: Colors.red)) :Text(item, style: TextStyle(fontSize: ThemeConfig.titleSize)),
                      )),
                    ).toList(),
                  ) ,
                ),

              ],
            ) ,
          ),
        );

      });
}


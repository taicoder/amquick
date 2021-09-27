import 'dart:math';

import 'package:amquick/all_export.dart';

class ItemCard extends StatelessWidget {
  final TaiSanModel taiSanModel;
  const ItemCard({
    Key? key,
    required this.taiSanModel,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  AssetDetail()));
      assetController.setUpdateFormAsset(taiSanModel);
    },
    child: Card(
      margin: const EdgeInsets.only(bottom: 5),
      elevation: 2,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius:  BorderRadius.all(Radius.circular(10))),
      child:  Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child:
                taiSanModel.hinhanh ==null ?
                Image.network(AppConfig.SERVER_IMAGE+"/"+ "noimage.png",fit:BoxFit.fitWidth,height: 150)
                    : Image.network(AppConfig.SERVER_IMAGE+"/"+ taiSanModel.hinhanh!.first,fit:BoxFit.fitWidth,height: 150)

                //Text("1"),
              //  Image.network("https://scr.vn/wp-content/uploads/2020/08/H%C3%8CNH-%E1%BA%A2NH-M%E1%BA%A0NG-%C4%90%E1%BA%B8P.jpg"),

                //Image.memory(dataFromBase64String(taiSanModel.hinhanh!=null ? taiSanModel.hinhanh![getRamdom(taiSanModel.hinhanh!.length)] : "" ),fit:BoxFit.fitWidth ,height: 150) ,
                // Image.asset(
                //   "assets/images/3.jpg",
                //   height: 150,
                //   fit: BoxFit.fitWidth,
                // ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      taiSanModel.ten,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ThemeConfig.headerSize,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "("+taiSanModel.loaits!.ten+")",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: ThemeConfig.titleSize,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Giá: "+convertVND(taiSanModel.gia)+" VNĐ",
                          style: TextStyle(
                            fontSize: ThemeConfig.titleSize,
                          ),
                        ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top:15),
                        child: Text("Mô tả:",
                        style: TextStyle(fontSize: ThemeConfig.headerSize,),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: Text(taiSanModel.mota == null || taiSanModel.mota.toString().isEmpty ? "[Chưa có thông tin]" : taiSanModel.mota.toString(),
                          style: TextStyle(fontSize: ThemeConfig.titleSize),
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    ),);
  }
}

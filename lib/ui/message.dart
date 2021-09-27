import 'dart:async';

import 'package:amquick/all_export.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  bool isLoading = false;
  String link=AppConfig.SERVER_URL+"/makefile/report/kiemke/"+globalController.token+"/"+globalController.year.toString();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      try {
       // var file = await DefaultCacheManager().getSingleFile("https://firebasestorage.googleapis.com/v0/b/filledstacks.appspot.com/o/filledstacks_tutorials.pdf?alt=media&token=a5e671e7-5acd-4bc4-a167-8d8483954d2a");
  //    print("99999999999999999999999: "+file.path);
       // await OpenFile.open(file);
       // Navigator.of(context).pop();
      }catch(e){
        print(e.toString());
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          TextButton(child: Text("Kiểm kê", style:TextStyle(color: Colors.white, fontSize: ThemeConfig.headerSize),),onPressed: () async {
            isLoading=true;
            setState(() {
              link=AppConfig.SERVER_URL+"/makefile/report/kiemke/"+globalController.token+"/"+globalController.year.toString();
              isLoading=false;
            });
          },),

          TextButton(child: Text("Thanh lý", style:TextStyle(color: Colors.white, fontSize: ThemeConfig.headerSize),),onPressed: () async {
            isLoading=true;
            setState(() {
              link=AppConfig.SERVER_URL+"/makefile/report/thanhly/"+globalController.token+"/"+globalController.year.toString();
              isLoading=false;
            });
          },),
        ],
      ),
      body: !isLoading ?  SfPdfViewer.network(link,canShowScrollStatus: true, pageSpacing: 10,) : CircularProgressIndicator(),
    );
  }
}



import 'dart:async';

import 'package:amquick/all_export.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  bool _isLoading = true;
  String link="http://192.168.1.9:3000/api/makefile/pdf/kiemke";

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
          TextButton(child: Text("Kiểm kê", style:TextStyle(color: Colors.white, fontSize: ThemeConfig.headerSize),),onPressed: (){
            setState(() {
              link="http://192.168.1.9:3000/api/makefile/pdf/kiemke";
            });

            Future.delayed(const Duration(milliseconds: 2000), () {
              setState(() {
                link="http://192.168.1.9:3000/api/makefile/pdf/kiemke";
              });
            });
          },),

          TextButton(child: Text("Thanh lý", style:TextStyle(color: Colors.white, fontSize: ThemeConfig.headerSize),),onPressed: (){
            setState(() {
              link="http://192.168.1.9:3000/api/makefile/pdf/thanhly";
            });

            Future.delayed(const Duration(milliseconds: 2000), () {
              setState(() {
                link="http://192.168.1.9:3000/api/makefile/pdf/thanhly";
              });
            });

          },),
        ],
      ),
      body: SfPdfViewer.network(link),
    );
  }
}



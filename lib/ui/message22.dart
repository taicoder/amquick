import 'package:amquick/all_export.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Message22 extends StatefulWidget {
  const Message22({Key? key}) : super(key: key);

  @override
  _Message22State createState() => _Message22State();
}

class _Message22State extends State<Message22> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    //changePDF();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterPluginPDFViewer'),
        actions: [
          IconButton(onPressed: (){
            //changePDF();

          }, icon: Icon(Icons.add)),

          IconButton(onPressed: (){

          }, icon: Icon(Icons.add_a_photo_rounded))
        ],
      ),
      body: SfPdfViewer.network(
          'http://192.168.1.9:3000/api/makefile/pdf'),
    );
  }
}



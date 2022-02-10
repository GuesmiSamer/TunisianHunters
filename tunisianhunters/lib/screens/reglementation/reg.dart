import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';


class Reg extends StatefulWidget {
  @override
  _RegState createState() => _RegState();
}

class _RegState extends State<Reg> {
  String pdf = "assets/jort-chasse-2019.pdf";
  PDFDocument _doc;
  bool _loading;
  @override
  void initState() {
    super.initState();
    _initPdf();
  }
  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(pdf);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Réglementations"),
        backgroundColor: Colors.green[400],),
      body:
      PDFViewer(document: _doc,),

    );
  }
}

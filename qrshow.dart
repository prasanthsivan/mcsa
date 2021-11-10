import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:untitled2/qrcode.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class qrshow extends StatelessWidget
{
  final _screenshotcontroller=ScreenshotController();
  String value;
  qrshow({this.value});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Qr Show Page"),
      ),
    body: Stack(
      fit: StackFit.expand,
      children: [
      Image.asset('assets/images/back2.jpg',
      fit: BoxFit.cover,
    ),
        Column(
              children: [
         SizedBox(height: 150.0,),
         Container(
           height: 270.0,
           width: 270.0,
           padding: EdgeInsets.symmetric(
             horizontal: 10.0,
             vertical: 25.0,
           ),
           decoration: BoxDecoration(
               color: Colors.white,
               shape: BoxShape.rectangle,
               borderRadius: BorderRadius.circular(20.0)
           ),
          child:Screenshot(
            controller: _screenshotcontroller,
            child:
            QrImage(
              backgroundColor: Colors.white,
              padding: EdgeInsets.only(left: 15.0),
              data: value,
              version: QrVersions.auto,
              size: 300,
            ),
          ),
         ),
                SizedBox(height: 20.0,),
                MaterialButton(
                  onPressed:_takeScreenshot,
                  minWidth: 280.0,
                  splashColor: Colors.green[800],
                  color: Colors.deepPurpleAccent,
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Text(
                    "SHARE",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                ),
          ],
        ),
      ],
    ),

    );

  }
  void _takeScreenshot() async {
    final uint8List = await _screenshotcontroller.capture();
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/image.png');
    await file.writeAsBytes(uint8List);
    await Share.shareFiles([file.path]);
  }
}

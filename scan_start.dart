import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/scan.dart';
import 'package:untitled2/securitymodule.dart';
import 'package:untitled2/thirdpage.dart';
void main()=>runApp(scan_start());
class scan_start extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
           automaticallyImplyLeading: false,
          title: Text("MOVE CONT & SECURITY APP"),
          leading: GestureDetector(onTap: (){
            Navigator.pop(context, MaterialPageRoute(builder: (context)=>thirdpage()));
          },
            //child: Icon(Icons.logout),
            child: Icon(Icons.arrow_back),
          ),
          ),
        body: scan_startStateful(),
        ),
    );
  }
}
class scan_startStateful extends StatefulWidget
{
  @override
  State<StatefulWidget>createState()=>_scan_startStateful();

}

class _scan_startStateful extends State<scan_startStateful>
{
  @override
  Widget build(BuildContext context)
  {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/water.jpg',
          fit: BoxFit.cover,
          // color: Colors.black26,
          colorBlendMode: BlendMode.darken,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: ()
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScanQR()));
              },
              minWidth: 320.0,
              height: 60.0,
              splashColor: Colors.green[800],
              color: Colors.deepPurple,
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Text("MOV CONT MODULE",style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: MaterialButton(
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>security()));
                },
                minWidth: 320.0,
                height: 60.0,
                splashColor: Colors.green[800],
                color: Colors.deepPurple,

                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Text("SECURITY MODULE",style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,

                ),
                ),
              ),
            ),

          ],
        ),
      ],
    );

  }

}
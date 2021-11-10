import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/scan_start.dart';
import 'package:untitled2/screen2.dart';
import 'package:untitled2/genaratorlogin.dart';
import 'package:untitled2/scan.dart';
void main()=>runApp(thirdpage());
class thirdpage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop:()async=>false,
    child: Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepPurple,
      automaticallyImplyLeading: false,
    title: Text("MOVE CONT & SECURITY APP"),

      leading: GestureDetector(onTap: (){
        Navigator.pop(context, MaterialPageRoute(builder: (context)=>MyAppScreen2()));
      },
        //child: Icon(Icons.logout),
        child: Icon(Icons.home),
      ),
    ),
      body: ThirdPage(),
    ),
    );
  }
}
class ThirdPage extends StatefulWidget
{
  @override
  State<StatefulWidget>createState()=>_ThirdPage();

}

class _ThirdPage extends State<ThirdPage>
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> scan_start()));
              },
              minWidth: 320.0,
              height: 60.0,
              splashColor: Colors.green[800],
              color: Colors.deepPurple,
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Text("MOV CONT & SECURITY MODULE",style: TextStyle(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>generatorlogin()));
                },
                minWidth: 320.0,
                height: 60.0,
                splashColor: Colors.green[800],
                color: Colors.deepPurple,

                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Text("GENERATE QR CODE",style: TextStyle(
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
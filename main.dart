import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        backgroundColor: Colors.red,
        body: HomeApp(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeApp extends StatefulWidget {
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyAppScreen2())));
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/mainbackground.jpg',
          fit: BoxFit.cover,
          // color: Colors.black26,
          colorBlendMode: BlendMode.darken,
        ),
    Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Align(
           alignment: Alignment.center,
           child: Image.asset('assets/images/lockapp.png',
             width: 300,
             height: 250,
           ),
         ),
         SizedBox(height: 20,),
         Align(
           alignment: Alignment.center,
           child: Text("WELCOME TO MCSA",style: TextStyle(
             fontSize: 26,
             color: Colors.red,
           ),
           ),
         )
       ],

      ),
    ],
    );
  }
}

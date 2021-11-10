import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:untitled2/qrshow.dart';

import 'genaratorlogin.dart';

void main() => runApp(qrcode());

class qrcode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      title: "QR Code Geneartor",
      home: MyQr(),
    );
  }
}

class MyQr extends StatefulWidget {
  @override
  _MyQr createState() => _MyQr();
}

class _MyQr extends State<MyQr> {
  var _adharno;
  var _name;
  var _age;
  var _gender;
  var _empcode;
  var _offercode;
  var _refcode;
  var _issuedate;
  var _valid;
  var _img;
  String value;

  final adharno = new TextEditingController();
  final name = new TextEditingController();
  final age = new TextEditingController();
  final gender = new TextEditingController();
  final empcode = new TextEditingController();
  final offercode = new TextEditingController();
  final refcode = new TextEditingController();
  final issuedate = new TextEditingController();
  final validto = new TextEditingController();
  final img = new TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState.validate()) {
      setState(() {
        _adharno = adharno.text;
        _name = name.text;
        _age = age.text;
        _gender = gender.text;
        _empcode = empcode.text;
        _offercode = offercode.text;
        _refcode = refcode.text;
        _issuedate = issuedate.text;
        _valid = validto.text;
        _img = img.text;

        // _final=(_username+_password);
        value=('${_adharno},${_name},${_age},${_gender},${_empcode},${_offercode},${_refcode},${_issuedate},${_valid},${_img}');
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>qrshow(value:value),));

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("QR Code Generator Page"),
        leading: GestureDetector(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>generatorlogin()));
        },
          //child: Icon(Icons.logout),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/main.jpg',
            fit: BoxFit.cover,
            // color: Colors.black26,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: 680.0,
                      width: 360.0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: SingleChildScrollView(
                        child: Form(
                          //autovalidate: true,
                          key: formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                  TextFormField(
                                  autocorrect: false,
                                  autofocus: false,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                  controller: adharno,
                                  decoration: InputDecoration(
                                    labelText: "Aadhaar No",
                                  ),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Pls Enter Adhar No";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              TextFormField(
                                autocorrect: false,
                                autofocus: false,
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                                controller: name,
                                decoration: InputDecoration(
                                  labelText: "Name",
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Pls Enter Name";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                autocorrect: false,
                                autofocus: false,
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                                controller: age,
                                decoration: InputDecoration(
                                    labelText: 'Age'
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Pls Enter Age";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                autocorrect: false,
                                autofocus: false,
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                                controller: gender,
                                decoration: InputDecoration(
                                    labelText: 'Gender'
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Pls Enter Gender";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                autocorrect: false,
                                autofocus: false,
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                                controller: empcode,
                                decoration: InputDecoration(
                                    labelText: 'Emp Profile'
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Pls Enter Emp Code";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                autocorrect: false,
                                autofocus: false,
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                                controller: offercode,
                                decoration: InputDecoration(
                                    labelText: 'Auth Code'
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Pls Enter Auth Code";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                autocorrect: false,
                                autofocus: false,
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                                controller: refcode,
                                decoration: InputDecoration(
                                    labelText: 'Ref Code'
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Pls Enter Ref Code";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                autocorrect: false,
                                autofocus: false,
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                                controller: issuedate,
                                decoration: InputDecoration(
                                    labelText: 'Issue Date'
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Pls Pick Date";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                autocorrect: false,
                                autofocus: false,
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                                controller: validto,
                                decoration: InputDecoration(
                                    labelText: 'Valid Upto'
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Pls Pick Date";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                autocorrect: false,
                                autofocus: false,
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                                controller: img,
                                decoration: InputDecoration(
                                    labelText: 'Img Link'
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Pls Paste Img Link";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                              ),
                              MaterialButton(
                                onPressed: validate,
                                minWidth: 230.0,
                                splashColor: Colors.green[800],
                                color: Colors.deepPurple,
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Text(
                                  "Generate QR Code",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}



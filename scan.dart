// import 'package:flutter/material.dart';
// import 'controller/form_controller.dart';
// import 'model/form.dart';
// void main() => runApp(security());
//
// class security extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Google Sheet Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Google Sheet Demo'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   //
//   // Note: This is a `GlobalKey<FormState>`,
//   // not a GlobalKey<MyCustomFormState>.
//   var mob="9496004935";
//   final _formKey = GlobalKey<FormState>();
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   String selectpost="";
//
//   // TextField Controllers
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController mobileNoController = TextEditingController();
//   TextEditingController feedbackController = TextEditingController();
//   final checkpost = TextEditingController();
//
//   // Method to Submit Feedback and save it in Google Sheets
//   void _submitForm() {
//     // Validate returns true if the form is valid, or false
//     // otherwise.
//     if (_formKey.currentState.validate()) {
//       // If the form is valid, proceed.
//       FeedbackForm feedbackForm = FeedbackForm(
//         nameController.text,
//         emailController.text,
//         mobileNoController.text=mob,
//         feedbackController.text,
//
//       );
//
//       FormController formController = FormController();
//
//       _showSnackbar("Submitting Feedback");
//
//       // Submit 'feedbackForm' and save it in Google Sheets.
//       formController.submitForm(feedbackForm, (String response) {
//         print("Response: $response");
//         if (response == FormController.STATUS_SUCCESS) {
//           // Feedback is saved succesfully in Google Sheets.
//           _showSnackbar("Feedback Submitted");
//         } else {
//           // Error Occurred while saving data in Google Sheets.
//           _showSnackbar("Error Occurred!");
//         }
//       });
//     }
//   }
//
//   // Method to show snackbar with 'message'.
//   _showSnackbar(String message) {
//     final snackBar = SnackBar(content: Text(message));
//     _scaffoldKey.currentState.showSnackBar(snackBar);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Form(
//                 key: _formKey,
//                 child:
//                 Padding(padding: EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       TextFormField(
//                         controller: nameController,
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Enter Valid Name';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                             labelText: 'Name'
//                         ),
//                       ),
//                       TextFormField(
//                         controller: emailController,
//                         validator: (value) {
//                           if (!value.contains("@")) {
//                             return 'Enter Valid Email';
//                           }
//                           return null;
//                         },
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: InputDecoration(
//                             labelText: 'Email'
//                         ),
//                       ),
//                       TextFormField(
//                         controller: TextEditingController(text: mob),
//                         validator: (value) {
//                           if (value.trim().length != 10) {
//                             return 'Enter 10 Digit Mobile Number';
//                           }
//                           return null;
//                         },
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           labelText: 'Mobile Number',
//                         ),
//                       ),
//                       TextFormField(
//                         controller: feedbackController,
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Enter Valid Feedback';
//                           }
//                           return null;
//                         },
//                         keyboardType: TextInputType.multiline,
//                         decoration: InputDecoration(
//                             labelText: 'Feedback'
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 )
//             ),
//             RaisedButton(
//               color: Colors.blue,
//               textColor: Colors.white,
//               onPressed:_submitForm,
//               child: Text('Submit Feedback'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'controller/form_controller_new.dart';
import 'model/form_new.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
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

  String qrCodeResult = "Not Yet Scanned";
  TextEditingController adharno = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController empcode = new TextEditingController();
  TextEditingController offercode = new TextEditingController();
  TextEditingController refcode = new TextEditingController();
  TextEditingController issuedate = new TextEditingController();
  TextEditingController valid = new TextEditingController();
  TextEditingController img = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectpost="";
  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    if (_formKey.currentState.validate()) {
      FeedbackFormNew feedbackFormNew = FeedbackFormNew(
        adharno.text=_adharno,
        name.text=_name,
        age.text=_age,
        gender.text=_gender,
        empcode.text=_empcode,
        offercode.text=_offercode,
        refcode.text=_refcode,
        issuedate.text=_issuedate,
        valid.text=_valid,
        img.text=_img,
      );
      FormControllerNew formControllerNew = FormControllerNew();
      _showSnackbar("Submitting Details");
      // Submit 'feedbackForm' and save it in Google Sheets.
      formControllerNew.submitForm(feedbackFormNew, (String response) {
        print("Response: $response");
        if (response == FormControllerNew.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          _showSnackbar("Details Submitted");
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      });
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Scan QR Code"),
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
          Stack(
            children: [
              Padding(padding: EdgeInsets.all(20.0),
             child: SingleChildScrollView(
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
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          MaterialButton(
                          onPressed: scan,
                          minWidth: 150.0,
                          splashColor: Colors.green[800],
                          color: Colors.deepPurple,
                          child: Text("SCAN",style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                          ),
                          ),
                            TextFormField(
                              autocorrect: false,
                              autofocus: false,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                              controller: TextEditingController(text: _adharno),
                              decoration: InputDecoration(
                                labelText: "Aadhaar No",
                              ),
                            ),
                            TextFormField(
                              autocorrect: false,
                              autofocus: false,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                              controller: TextEditingController(text: _name),
                              decoration: InputDecoration(
                                labelText: "Name",
                              ),
                            ),
                            TextFormField(
                              autocorrect: false,
                              autofocus: false,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                              controller: TextEditingController(text: _age),
                              decoration: InputDecoration(
                                labelText: "Age",
                              ),
                            ),
                            TextFormField(
                              autocorrect: false,
                              autofocus: false,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                              controller: TextEditingController(text: _gender),
                              decoration: InputDecoration(
                                labelText: "Gender",
                              ),
                            ),
                            TextFormField(
                              autocorrect: false,
                              autofocus: false,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                              controller: TextEditingController(text: _empcode),
                              decoration: InputDecoration(
                                labelText: "Emp Code",
                              ),
                            ),
                            TextFormField(
                              autocorrect: false,
                              autofocus: false,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                              controller: TextEditingController(text: _offercode),
                              decoration: InputDecoration(
                                labelText: "Auth Code",
                              ),
                            ),
                            TextFormField(
                              autocorrect: false,
                              autofocus: false,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                              controller: TextEditingController(text: _refcode),
                              decoration: InputDecoration(
                                labelText: "Ref Code",
                              ),
                            ),
                            TextFormField(
                              autocorrect: false,
                              autofocus: false,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                              controller: TextEditingController(text: _issuedate),
                              decoration: InputDecoration(
                                labelText: "Issue Date",
                              ),
                            ),
                            TextFormField(
                              autocorrect: false,
                              autofocus: false,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                              controller: TextEditingController(text: _valid),
                              decoration: InputDecoration(
                                labelText: "Valid Up to",
                              ),
                            ),

                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children:<Widget> [
                                MaterialButton(
                                  onPressed: ()
                                  async {
                                    var _url=_img;
                                    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

                                  },
                                  minWidth: 60.0,
                                  splashColor: Colors.green[800],
                                  color: Colors.deepPurple,
                                  child: Text("PHOTO",style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                MaterialButton(
                                  onPressed: _submitForm,
                                  minWidth: 150.0,
                                  splashColor: Colors.green[800],
                                  color: Colors.deepPurple,
                                  child: Text("SAVE",style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
                ),
              ),
            ],
          ),
        ],
      ),

    );

  }
  Future scan() async {
    try {
      String codeSanner = await BarcodeScanner.scan();
      setState(() {
        qrCodeResult = codeSanner;
        var splitted=qrCodeResult.split(',');
        _adharno=splitted[0];
        _name=splitted[1];
        _age=splitted[2];
        _gender=splitted[3];
        _empcode=splitted[4];
        _offercode=splitted[5];
        _refcode=splitted[6];
        _issuedate=splitted[7];
        _valid=splitted[8];
        _img=splitted[9];
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          qrCodeResult = "The user did not grant the camera permission!";
        });
      } else {
        setState(() => qrCodeResult = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => qrCodeResult ='null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => qrCodeResult = 'Unknown error: $e');
    }
  }

}

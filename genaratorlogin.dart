import 'package:flutter/material.dart';
import 'package:untitled2/qrcode.dart';
import 'package:untitled2/thirdpage.dart';
void main()=>runApp(generatorlogin());
class generatorlogin extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Page",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Generator(),
    );

  }
}
class Generator extends StatefulWidget
{
  @override
  _Generator createState()=>_Generator();
}
class _Generator extends State<Generator>
{
  var _username;
  var _password;

  final user=new TextEditingController();
  final pass=new TextEditingController();
  GlobalKey<FormState> formkey =GlobalKey<FormState>();


  void validate()
  {
    if(formkey.currentState.validate())
    {
      setState(() {
        _username=user.text;
        _password=pass.text;
      });
      if(_username=="admin"&&_password=="Admin@123" || _username=="33div"&&_password=="Asdfg@2345")
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>qrcode()));
      }
      else
      {
        showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupDialog(context));
      }

    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("MOVE CONT & SECURITY APP"),
        leading: GestureDetector(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>thirdpage()));
        },
          //child: Icon(Icons.logout),
          child: Icon(Icons.arrow_back),
        ),
      ),
    resizeToAvoidBottomInset: false,
      body: Stack(
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
              Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child:  Container(
                        height: 270.0,
                        width: 360.0,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 25.0,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20.0)
                        ),

                        child: SingleChildScrollView(
                          child:Form(
                            autovalidate: true,
                            key: formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20.0,
                                  ),
                                  child: TextFormField(
                                    autocorrect: false,
                                    autofocus: false,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                    ),
                                    controller: user,
                                    decoration: InputDecoration(
                                      hintText: "Username",
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      contentPadding: EdgeInsets.all(15.0),
                                    ),

                                    validator: (String value){
                                      if(value.isEmpty)
                                      {
                                        return "Pls Enter Username";
                                      }
                                      else
                                      {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                TextFormField(
                                  autocorrect: false,
                                  autofocus: false,
                                  obscureText: true,
                                  style: TextStyle(
                                    fontSize: 22.0,

                                  ),
                                  controller: pass,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    contentPadding: EdgeInsets.all(15.0),
                                  ),
                                  validator: (String value){
                                    if(value.isEmpty)
                                    {
                                      return "Pls Enter Password";
                                    }
                                    else
                                    {
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
                                  child: Text("LOGIN",style: TextStyle(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Invalid User Credentials'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Pls Enter Correct Username & Password"),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
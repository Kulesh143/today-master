import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
final FirebaseAuth auth=FirebaseAuth.instance;
final GoogleSignIn googleSignIn=new GoogleSignIn();
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    home: new myApp(),
  ));
}
class myApp extends StatefulWidget{
  @override
  _State createState()=>new _State();
}
class _State extends State<myApp>{
  String status;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    status='Not Auhtenticated';
  }
  void signInAnon()async{

    User user=(await auth.signInAnonymously()).user;
if(user!=null&&user.isAnonymous==true){
  setState(() {
    status='Signed In anonymously';
  });
}else{
  setState(() {
    status='Signed In Failed';
  });
}
  }
  void signOut()async{
    await auth.signOut();
    setState(() {
      status='Signed Out';
    });

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text(status),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(onPressed: signOut,child: Text('Sign Out'),),
                RaisedButton(onPressed: signInAnon,child: Text('Sign In Anon'),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

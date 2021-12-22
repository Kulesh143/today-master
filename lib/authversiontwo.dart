import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'dart:io';
import 'ourAuth.dart'as FBAuth;
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
    status='Not Authenticated';
    signinWithGoogle();
  }

  void signinWithGoogle()async{
if(await FBAuth.signInWithGoogle()==true){
  setState(() {
    status='Signed in';
  });
}else{
  status='Could not Sign in';
}
  }
  void signout()async{
if(await FBAuth.SignOut()==true){
  setState(() {
    status='Signed Out';
  });
}else{
  status='Signed In';
}
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
                RaisedButton(onPressed: signout,child: Text('Sign out'),),
                RaisedButton(onPressed: signinWithGoogle,child: Text('Sign In With google'),),
              ],
            )
          ],
        ),
      ),
    );
  }
}

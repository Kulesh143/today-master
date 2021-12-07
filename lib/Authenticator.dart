import 'package:flutter/material.dart';
class Authenticator extends StatefulWidget{
  Authenticator({Key key,this.onAuthenticated});
  final ValueChanged<bool>onAuthenticated;
  @override
  _AuthenticatorState createState()=>new _AuthenticatorState(onAuthenticated:onAuthenticated);
}
class _AuthenticatorState extends State<Authenticator>{
  _AuthenticatorState({Key key,this.onAuthenticated});
  final ValueChanged<bool>onAuthenticated;
TextEditingController _user;
TextEditingController _password;

void onPressed(){
  if(_user.text!='user'||_password.text!='1234'){
    onAuthenticated(false);
  }else{
    onAuthenticated(true);

  }
}
@override
  void initState() {
    _password=new TextEditingController();
    _user=new TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            new TextField(controller: _user,decoration: InputDecoration(labelText: 'Username'),),
            new TextField(controller: _password,decoration: InputDecoration(labelText: 'Password'),),
            new Padding(padding: EdgeInsets.all(10.0),
            child: RaisedButton(onPressed: onPressed,child: new Text('Login'),),
            ),
          ],
        ),
      ),
    );
  }
}
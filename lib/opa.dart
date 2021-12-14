import 'package:flutter/material.dart';
void main(){
  runApp(new MaterialApp(
    home: new myApp(),
  ));
}
class myApp extends StatefulWidget{
  @override
  _State createState()=>new _State();
}
class _State extends State<myApp>{
  bool _visible;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _visible=true;
  }
  void _toggleVisible(){
    setState(() {
      _visible=!_visible;
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
          new Opacity(opacity: _visible?1.0:0.2,child: Text('Now you see me now you dont\'t!'),
          ),
            RaisedButton(onPressed: _toggleVisible,child: Text('Toggle'),),
          ],
        ),
      ),
    );
  }
}

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
  int turns;
  double _value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    turns=0;
    _value=0.0;
  }
  void onChanged(double value){
    setState(() {
      _value=value;
      turns=_value.toInt();
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
           new Slider(value: _value, onChanged: onChanged,min: 0.0,max: 4.0,),
            new RotatedBox(quarterTurns: turns,child: Text('Hello World!'),)
          ],
        ),
      ),
    );
  }
}

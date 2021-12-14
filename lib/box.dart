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
            new Text('Sun Shine'),
            Container(
              child: Image(image: AssetImage('images/smile.png'),
              ),padding: EdgeInsets.all(32.0),
              decoration: BoxDecoration(border: new Border.all(color: Colors.orange,width: 2.0),gradient:
              new RadialGradient(colors: <Color>[Colors.red,Colors.yellow])),
            ),
          ],
        ),
      ),
    );
  }
}

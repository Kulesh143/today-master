import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
void main(){
  runApp(new MaterialApp(
    home: new myApp(),
  ));
}
class myApp extends StatefulWidget{
  @override
  _State createState()=>new _State();
}
class _State extends State<myApp> with SingleTickerProviderStateMixin{
  Animation<double>animation;
  AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=new AnimationController(vsync: this,duration: const Duration(milliseconds: 5000));
    animation=new Tween(begin: 0.0,end: 200.0).animate(controller);
    animation.addListener(() {
      setState(() {

      });
    });
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
      height: animation.value,
        width: animation.value,
        child: Center(
          child: new FlutterLogo(size: 300.0,),
        ),
      ),
    );
  }
}

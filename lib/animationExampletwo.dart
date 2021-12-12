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
class _State extends State<myApp> with SingleTickerProviderStateMixin{
  Animation animation;
  AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=new AnimationController(vsync: this,duration: const Duration(milliseconds: 10000));
    final CurvedAnimation curve=new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation=new Tween(begin: 0.0,end: 300.0).animate(curve);
    controller.forward();
  }
  Widget builder(BuildContext context,Widget child){
    return new Container(height: animation.value,width: animation.value,child: new FlutterLogo(),);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: Center(
          child: new AnimatedBuilder(animation: animation, builder: builder),
        ),
      ),
    );
  }
}

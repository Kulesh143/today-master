import 'package:flutter/material.dart';
import 'dart:async';
import 'TimeDisplay.dart';
class TimeCounter extends StatefulWidget{
  @override
  _TimeCounterState createState()=>new _TimeCounterState();
}
class _TimeCounterState extends State<TimeCounter>{
  Stopwatch watch;
  Timer timer;
  Duration duration;
  void onstart(){
    setState(() {
      watch=new Stopwatch();
      timer=new Timer.periodic(new Duration(microseconds: 250),onTimeOut);

    });watch.start();
  }
  void onStop(){
    timer.cancel();
    watch.stop();
  }
  void onTimeOut(Timer timer){
    if(!watch.isRunning)return;
    setState(() {
      duration=watch.elapsed;
    });
  }
  void onClear(Duration value){
    setState(() {
      duration=watch.elapsed;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    setState(() {

      duration=new Duration();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: [
            TimeDisplay(
              color: Colors.red,
              duration: duration,
              onClear: onClear,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(10.0),child: RaisedButton(onPressed: onstart,child: Text('Start'),),),
                Padding(padding: EdgeInsets.all(10.0),child: RaisedButton(onPressed: onStop,child: Text('Stop'),),),
              ],
            ),
          ],
        ),
      ),

    );
  }

}
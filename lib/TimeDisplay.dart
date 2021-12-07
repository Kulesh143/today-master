import 'package:flutter/material.dart';
class TimeDisplay extends StatelessWidget{
  TimeDisplay({Key key,Color this.color,Duration this.duration,this.onClear}):super(key: key);
  Duration duration=new Duration();
  Color color=Colors.green;
  final ValueChanged<Duration>onClear;
  void onClicked(){
    onClear(duration);
  }
  @override
  Widget build(BuildContext context) {
   return new Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Padding(padding: EdgeInsets.all(5.0),child: Text(
         duration.toString(),style: TextStyle(fontSize: 32.0,color: color),
       ),

       ),
       IconButton(onPressed: onClicked, icon: Icon(Icons.clear)),
     ],
   );
  }

}
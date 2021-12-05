import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
enum Actions{Increment,Decrement}
int reducer(int state,dynamic action){
  if(action==Actions.Increment)state++;
  if(action==Actions.Decrement)state--;
  return state;
}
void main(){
  final store=new Store<int>(reducer, initialState: 0);
  runApp(new myApp(
    store:store,
  ));
}
class myApp extends StatelessWidget{
  myApp({Key key,this.store}):super(key: key);
  final Store<int>store;
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(store: store, child: new MaterialApp(
      title: 'flutter redux',
      home: Scaffold(
        appBar: new AppBar(title: Text('Redux app'),

        ),body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              new StoreConnector<int,String>(builder: (context,count){
                return Text(count,style: TextStyle(fontSize: 24.0),);
              }, converter: (store)=>store.state.toString(),),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new IconButton(onPressed: ()=>store.dispatch(Actions.Increment), icon: Icon(Icons.add)),
                  new IconButton(onPressed: ()=>store.dispatch(Actions.Decrement), icon: Icon(Icons.remove)),
                ],),
            ],
          ),
        ),
      ),
      ),
    ));
  }

}
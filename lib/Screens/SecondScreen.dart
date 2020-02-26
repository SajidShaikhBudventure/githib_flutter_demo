
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../main.dart';

class SecondScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_SecondScreenState();

}

class _SecondScreenState extends State<SecondScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColorDark :Colors.green 
      ),
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Second Screen'),
          automaticallyImplyLeading: true,
        ),
        backgroundColor: Colors.white,
        body:Center(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(onPressed: null,
             child:Container(
               margin: EdgeInsets.all(10),
               decoration: BoxDecoration(
                 color: Colors.grey[300],
                 borderRadius: BorderRadius.circular(10),    
               ),
              child:Padding(
               padding:EdgeInsets.all(10),
               child:Text('Go to First Screen',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
            )))],
        ),
      ),
    ));
  }

  void _gotoFirstScreen(){
    Navigator.pop(context, true);
  }

  Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
 }

}
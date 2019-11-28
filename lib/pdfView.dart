import 'package:flutter/material.dart';
import 'package:flutter_app/model/employee.dart';
import 'package:flutter_app/database/DbHelper.dart';
import 'dart:async';


class PdfView extends StatefulWidget{

  @override
  EmployeePageList createState() => new EmployeePageList();

}

class EmployeePageList extends State{

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Employee List'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: Center(
         child: new Container(
             child:  new Text(
                 "Hellow World!",
                 style: new TextStyle(
                     fontWeight: FontWeight.normal, fontSize: 18.0)),

         ),
        )
      ),
    );

  }

  void showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

}





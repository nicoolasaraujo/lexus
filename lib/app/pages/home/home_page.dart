import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/pages/ClassActivity/class_module.dart';
import 'package:lexus/app/pages/home/home_bloc.dart';
import 'package:lexus/app/pages/home/home_module.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeBloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
    Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FlatButton(  
          color: Colors.lightGreen,
          child: Text("Iniciar!", style: TextStyle(color: Colors.white),),
          onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => ClassModule())
        ) ,
        ) ,),

    ));       
}
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lexus/app/components/home_button.dart';

import 'package:lexus/app/pages/ClassActivity/ClassActivity_module.dart';
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
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Align(
        alignment: Alignment.topCenter,
        child: Text('Bem vindo ao Lexus',
            style: TextStyle(color: Color(0xff9B59B6), fontSize: 20)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: HomeButton(
                Icons.book,
                Text('Aulas', style: TextStyle(color: Colors.white)),
                this.navigateClassess),
          ),
          Expanded(
            flex: 5,
            child: HomeButton(
                Icons.sync,
                Text(
                  'Sincronizar',
                  style: TextStyle(color: Colors.white),
                ),
                this.navigateClassess),
          ),
        ],
      )
    ]));
  }

  void navigateClassess() {
    Navigator.push(context,
        CupertinoPageRoute(builder: (context) => ClassActivityModule()));
  }
}


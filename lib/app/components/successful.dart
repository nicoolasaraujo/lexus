import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Successful extends StatefulWidget {
  @override
  _SuccessfulState createState() => _SuccessfulState();
}

class _SuccessfulState extends State<Successful> {
  bool _showText = false;
  
  @override
  void initState(){
    super.initState();
     if(!this._showText){
       Timer(const Duration(milliseconds: 1500), (){
         setState(() {
          this._showText = true; 
         });
       });
     }
     Timer(const Duration(milliseconds: 3200), () {
      Navigator.pop(context);
    });  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text( this._showText ? "Parabéns!" : '', style: TextStyle(fontSize: 35, color: Color(0xff00CA71) ),),
          Container(
            // decoration: BoxDecoration(color: Colors.red),
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height/2,
                maxWidth: MediaQuery.of(context).size.width),
            child: Align(
                alignment: Alignment.center,
                child: FlareActor(
                  "assets/flare/SuccessCheck.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
                  animation: 'Untitled',
                )),
          ),
          Text(this._showText? "Voce Acertou!": '', style: TextStyle(fontSize: 35, color: Color(0xff00CA71) ),),
        ],
      ),
      ) ,
    );
  }
}

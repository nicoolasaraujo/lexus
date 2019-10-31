import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerFeedBack extends StatefulWidget {
  final bool positive;
  AnswerFeedBack({Key key, @required this.positive}) : super(key: key);

  @override
  _AnswerStateFeedBackState createState() => _AnswerStateFeedBackState();
}

class _AnswerStateFeedBackState extends State<AnswerFeedBack> {
  bool _showText = false;
  Color _themeColor;
  List<String> _textList = [];
  String _flareFile = "";
  String _flareName = "";

  @override
  void initState(){
    if (widget.positive){
      this._themeColor = Color(0xff00CA71);
      this._textList = ["Parabéns!", "Você acertou!"];
      this._flareFile = "assets/flare/SuccessCheck.flr";
      this._flareName = "Untitled";
    }
    else {
      this._themeColor = Color(0xffD93E47);
      this._textList = ["Que pena", "Essa não é a resposta"];
      this._flareFile = "assets/flare/Status_E_S.flr";
      this._flareName = "Error";
    }

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
          Text( this._showText ? this._textList[0] : '', style: TextStyle(fontSize: 35, color: this._themeColor ),),
          Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height/2,
                maxWidth: MediaQuery.of(context).size.width),
            child: Align(
                alignment: Alignment.center,
                child: FlareActor(
                  this._flareFile,
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
                  animation: this._flareName,
                )),
          ),
          Text(this._showText? this._textList[1]: '', style: TextStyle(fontSize: 35, color: this._themeColor ),),
        ],
      ),
      ) ,
    );
  }
}

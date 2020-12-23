import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
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
  void initState() {
    if (widget.positive) {
      this._themeColor = Color(0xff00CA71);
      this._textList = ["Parabéns!", "Parabéns! Você acertou!"];
      this._flareFile = "assets/flare/SuccessCheck.flr";
      this._flareName = "Untitled";
    } else {
      this._themeColor = Color(0xffD93E47);
      this._textList = ["Que pena", "Resposta incorreta!"];
      this._flareFile = "assets/flare/Status_E_S.flr";
      this._flareName = "Error";
    }

    super.initState();
    if (!this._showText) {
      Timer(const Duration(milliseconds: 1000), () {
        setState(() {
          this._showText = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 10,
            child: AnimatedContainer(
              padding: EdgeInsets.all(0),
              curve: Curves.fastOutSlowIn,
              margin: EdgeInsets.only(top: 0),
              duration: Duration(milliseconds: 900),
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: FlareActor(
                this._flareFile,
                alignment: Alignment.center,
                fit: BoxFit.scaleDown,
                animation: this._flareName,
              ),
            )),
        Expanded(
            flex: this._showText ? 2 : 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 850),
              child: AutoSizeText(
                this._showText ? this._textList[1] : ' ',
                style: TextStyle(fontSize: 25, color: this._themeColor),
              ),
            )),
        Expanded(
            flex: this._showText ? 2 : 0,
            child: AnimatedContainer(
                width: double.infinity,
                color: this._themeColor,
                padding: EdgeInsets.all(0),
                duration: Duration(milliseconds: 1000),
                child: this._showText
                    ? FlatButton(
                        color: Colors.white70,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                'Continuar',
                                style: TextStyle(
                                    color: this._themeColor, fontSize: 20),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Icon(
                                    Icons.forward,
                                    color: this._themeColor,
                                  ))
                            ]),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    : SizedBox(
                        height: 0,
                      )))
      ],
    ));
  }
}

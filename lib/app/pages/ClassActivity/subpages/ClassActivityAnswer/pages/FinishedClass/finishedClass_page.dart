import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/components/option_word.dart';

import '../../class_module.dart';
import 'finishedClass_bloc.dart';

class FinishedClass extends StatefulWidget {
  @override
  _FinishedClassState createState() => _FinishedClassState();
}

class _FinishedClassState extends State<FinishedClass> {
  var bloc = ClassAnswerModule.to.getBloc<FinishedClassBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Text('Parabéns!',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w800)),
                    Text(
                      'Você concluiu a aula',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                    )
                  ],
                )),
          ),
          Expanded(
              flex: 7,
              child: AnimatedContainer(
                padding: EdgeInsets.all(0),
                curve: Curves.fastOutSlowIn,
                margin: EdgeInsets.only(top: 0),
                duration: Duration(milliseconds: 1000),
                constraints:
                    BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
                child: FlareActor(
                  'assets/flare/trophy.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
                  animation: 'animate',
                ),
              )),
          Expanded(
            flex: 1,
            //  onPressed: () =>  Navigator.of(context, rootNavig ator: true).pop(),
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: FlatButton(
              child: Text('Voltar para listagem de aulas', style: TextStyle(color: Colors.white)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              color: Color(0xff9B59B6),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            )),
          )
        ],
      ),
    );
  }
}

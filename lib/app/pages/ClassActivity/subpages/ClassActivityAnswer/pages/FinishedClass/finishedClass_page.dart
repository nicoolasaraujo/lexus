import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FinishedClass extends StatefulWidget {

  @override
  _FinishedClassState createState() => _FinishedClassState();
}

class _FinishedClassState extends State<FinishedClass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Parabéns! Você concluiu a aula ....') ,
            ) ,
          ),
          Expanded(
              flex: 8,
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
            child: RaisedButton(
               onPressed: () =>  Navigator.of(context, rootNavigator: true).pop(),
              // onPressed: () => {},
              child: Text('Voltar a listagem de aula'),
            ),
          )
        ],
      ),
    );
  }
}

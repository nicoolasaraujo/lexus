import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/components/option_word.dart';
import 'package:lexus/app/pages/ClassActivity/subpages/ClassActivityAnswer/pages/Situation/situation_bloc.dart';

import '../../class_module.dart';
import 'finishedClass_bloc.dart';

class FinishedClass extends StatefulWidget {
  @override
  _FinishedClassState createState() => _FinishedClassState();
}

class _FinishedClassState extends State<FinishedClass> {
  var bloc = ClassAnswerModule.to.getBloc<FinishedClassBloc>();
  var questionsBloc = ClassAnswerModule.to.getBloc<SituationBloc>();

  bool showCard = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Text('Parabéns!',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
                  Text(
                    'Você concluiu a atividade',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                  )
                ],
              )),
          Expanded(
              flex: 1,
              child: AnimatedContainer(
                alignment: Alignment.center,
                padding: EdgeInsets.all(0),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 1000),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height),
                child: FlareActor(
                  'assets/flare/trophy.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
                  animation: 'animate',
                  callback: (value) => this.setState(() {
                    showCard = !showCard;
                  }),
                ),
              )),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                this._buildAnswersResult(
                    "assets/flare/SuccessCheck.flr",
                    Text(
                      "${this.questionsBloc.rightAnswers} Respostas corretas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff3A7146),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Color(0xff00CA71),
                    "Untitled"),
                this._buildAnswersResult(
                    "assets/flare/Status_E_S.flr",
                    Text(
                      "${this.questionsBloc.wrongAnswers} Respostas incorretas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffB53C27),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Color(0xffD93E47),
                    "Error")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: RaisedButton.icon(
                    padding: EdgeInsets.all(12),
                    color: Colors.white,
                    onPressed: () => {},
                    icon: Icon(
                      Icons.redo,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: Text(
                      "Refazer",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1.0)),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Expanded(
                  child: FlatButton.icon(
                      padding: EdgeInsets.all(12),
                      icon: Icon(
                        Icons.my_library_books,
                        color: Colors.white,
                      ),
                      label: Text('Atividades',
                          style: TextStyle(color: Colors.white)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Color(0xff9B59B6),
                      onPressed: () =>
                          Navigator.of(context, rootNavigator: true).pop()),
                )
              ],
            ),

            // Navigator.of(context, rootNavigator: true).pop(),
          ),
        ],
      ),
    );
  }

  _buildAnswersResult(
      String flareName, Widget subTitle, Color color, String action) {
    return Card(
      child: AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 1000),
          constraints: BoxConstraints(
              maxHeight: 250,
              maxWidth: (MediaQuery.of(context).size.width / 2) - 40),
          child: !showCard
              ? SizedBox(
                  height: 0,
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 2 / 2,
                      child: FlareActor(
                        flareName,
                        fit: BoxFit.scaleDown,
                        animation: action,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Wrap(children: [subTitle]),
                    )
                  ],
                )),
      elevation: 8,
    );
  }
}

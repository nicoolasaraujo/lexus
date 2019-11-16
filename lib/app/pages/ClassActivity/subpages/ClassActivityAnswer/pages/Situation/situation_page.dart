import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/components/answer_FeedBack.dart';
import 'package:lexus/app/components/clasess_container.dart';
import 'package:lexus/app/components/option_word.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/model/Option.dart';
import 'package:lexus/app/model/Situation.dart';

import '../../class_bloc.dart';
import '../../class_module.dart';
import 'situation_bloc.dart';

class SituationPage extends StatefulWidget {
  @override
  _SituationPageState createState() => _SituationPageState();
}

class _SituationPageState extends State<SituationPage> {
  var classBloc = ClassAnswerModule.to.getBloc<ClassAnswerBloc>();
  var situationBloc = ClassAnswerModule.to.getBloc<SituationBloc>();

  @override
  void initState() {
    super.initState();
    this.situationBloc.loadSituations();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClassesContainer(
          listeningStream: this.situationBloc.hasSelected,
          confirm: this.confirmAction,
          title: "",
          child: StreamBuilder<Situation>(
              stream: situationBloc.outSituation,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var currentSituation = snapshot.data;
                  return Center(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: currentSituation.situationType ==
                                EnumSituationType.PLACE_SITUATION.index
                            ? Text(
                                "Seleciona uma palavra de acordo com o local",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20))
                            : Text(currentSituation.question,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25)),
                      ),
                      currentSituation.situationType ==
                              EnumSituationType.PLACE_SITUATION.index
                          ? Image.asset(
                              classBloc.userAnswer.place.imgPath,
                              height: 160,
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      currentSituation.situationType ==
                              EnumSituationType.PLACE_SITUATION.index
                          ? Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                currentSituation.title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      Expanded(
                        flex: 1,
                          child: Container(
                              alignment: Alignment.center,
                              child: Align(
                                alignment: Alignment.center,
                                child: this.buildOptions(snapshot.data.options),
                              )))
                    ],
                  ));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Nenhum registro encontrado!',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }

  Widget buildOptions(List<Option> list) {
    return StreamBuilder<Option>(
        stream: situationBloc.outSelectedWord,
        builder: (context, snapshot) {
          return (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list
                .asMap()
                .map((index, element) => MapEntry(
                    index,
                    OptionWord(
                      handleTap: situationBloc.changeSelected,
                      title: element.description,
                      selected: element == this.situationBloc.selectedWord,
                      index: index,
                    )))
                .values
                .toList(),
          ));
        });
  }

  void confirmAction() async {
    bool isCorrect = this.situationBloc.validateAnswer();
    await showModalBottomSheet(
        elevation: 5,
        useRootNavigator: true,
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AnimatedContainer(
                padding: EdgeInsets.all(0),
                duration: Duration(seconds: 2),
                height: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: AnswerFeedBack(
                  positive: isCorrect,
                ),
              ),
            ],
          );
        });

    classBloc.increaseProgress();
    Timer(const Duration(milliseconds: 900), () {
      if (this.situationBloc.isLast()) {
        this
            .situationBloc
            .finishClass()
            .then((value) =>
                Navigator.pushReplacementNamed(context, '/class/finished'))
            .catchError((error) => print(error));
      } else {
        this.situationBloc.next();
      }
    });
  }
}

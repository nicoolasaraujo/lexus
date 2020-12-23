import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/components/answer_FeedBack.dart';
import 'package:lexus/app/components/clasess_container.dart';
import 'package:lexus/app/components/option_word.dart';
import 'package:lexus/app/components/photoHero.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/model/Option.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/pages/ClassActivity/subpages/ClassActivityAnswer/pages/Place/place_details.dart';

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
                      Align(
                        alignment: Alignment.topLeft,
                        child: StreamBuilder<int>(
                            stream: this.classBloc.outFinishedQuestions,
                            builder: (context, snapshot) {
                              return Text(
                                  "Questão ${snapshot.data + 1}/${this.classBloc.totalScreens}",
                                  style: TextStyle(
                                      color: Color(0xff5C5757),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18));
                            }),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        height: 2,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: currentSituation.situationType ==
                                EnumSituationType.PLACE_SITUATION.index
                            ? AutoSizeText(
                                "Selecione uma palavra de acordo com o local: ${classBloc.userAnswer.place.description}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff5C5757),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18))
                            : AutoSizeText(
                                currentSituation.question,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff5C5757),
                                    fontWeight: FontWeight.w700),
                                maxLines: 4,
                              ),
                      ),
                      currentSituation.situationType ==
                              EnumSituationType.PLACE_SITUATION.index
                          ? Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3))
                                  ]),
                              child: PhotoHero(
                                photo: classBloc.userAnswer.place.imgPath,
                                onTap: () =>
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                PlaceDetails(
                                                    this
                                                        .classBloc
                                                        .userAnswer
                                                        .place
                                                        .imgPath,
                                                    "Teste",
                                                    this
                                                        .classBloc
                                                        .userAnswer
                                                        .place
                                                        .imgPath))),
                                width: 300,
                              ))
                          : SizedBox(
                              height: 0,
                            ),
                      Expanded(
                          flex: 1,
                          child: Container(
                              alignment: Alignment.center,
                              child: Align(
                                alignment: Alignment.center,
                                child: this
                                    .buildOptionsList(currentSituation.options),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: list
                .asMap()
                .map((index, element) => MapEntry(
                    index,
                    Expanded(
                      flex: 1,
                      child: OptionWord(
                        handleTap: situationBloc.changeSelected,
                        title: element.description,
                        selected: element == this.situationBloc.selectedWord,
                        index: index,
                      ),
                    )))
                .values
                .toList(),
          ));
        });
  }

  Widget buildOptionsList(List<Option> list) {
    return ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          var element = list[index];
          return Container(
            margin: EdgeInsets.all(4),
            child: StreamBuilder<Option>(
                stream: situationBloc.outSelectedWord,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return OptionWord(
                      handleTap: situationBloc.changeSelected,
                      title: element.description,
                      selected: element == this.situationBloc.selectedWord,
                      index: index,
                    );
                  } else if (!snapshot.hasError) {
                    return OptionWord(
                      handleTap: situationBloc.changeSelected,
                      title: element.description,
                      selected: false,
                      index: index,
                    );
                  } else {
                    return Center(
                      heightFactor: 1,
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          );
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

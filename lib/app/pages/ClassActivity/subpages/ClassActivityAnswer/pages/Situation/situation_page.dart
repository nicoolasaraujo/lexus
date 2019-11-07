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
          confirm: this.confirmAction,
          title: "Seleciona uma palavra de acordo com o local",
          child: StreamBuilder<Situation>(
              stream: situationBloc.outSituation,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var currentSituation = snapshot.data;
                  List<Widget> children = [];
                  currentSituation.options.asMap().forEach((index, item) =>
                      children.add(OptionWord(
                          title: item.description,
                          index: index,
                          handleTap: situationBloc.changeSelected,
                          selected: item == situationBloc.selectedWord)));
                  return Column(
                    children: <Widget>[
                      Image.asset(
                        classBloc.userAnswer.place.imgPath,
                        height: 160,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          currentSituation.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                      this.buildOptions(snapshot.data.options)
                    ],
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
    await Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => AnswerFeedBack(positive: isCorrect)));

    if (this.situationBloc.isLast()) {
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      this.situationBloc.next();
    }
  }
}

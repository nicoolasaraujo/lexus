import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/components/answer_FeedBack.dart';
import 'package:lexus/app/components/clasess_container.dart';
import 'package:lexus/app/components/option_word.dart';

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
          child: Container(
              child: StreamBuilder<Situation>(
                  stream: situationBloc.outSituation,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var currentSituation = snapshot.data;
                      List<Widget> children = [];
                      currentSituation.randomWords.asMap().forEach(
                          (index, item) => children.add(OptionWord(
                              title: item,
                              index: index,
                              handleTap: situationBloc.changeSelected,
                              selected: item == situationBloc.selectedWord)));
                      return Column(
                        children: <Widget>[
                          Image.asset(
                              classBloc.userAnswer.place.imgPath , height: 160,),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              currentSituation.description,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16 ),
                            ),
                          ),
                          this.buildOptions(snapshot.data.randomWords)
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }))),
    );
  }

  Widget buildOptions(List<String> list) {
    return StreamBuilder<String>(
        stream: situationBloc.outSelectedWord,
        builder: (context, snapshot) {
          return (Column(
            children: list
                .asMap()
                .map((index, element) => MapEntry(
                    index,
                    OptionWord(
                      handleTap: this.situationBloc.changeSelected,
                      title: element,
                      selected: element == this.situationBloc.selectedWord,
                      index: index,
                    )))
                .values
                .toList(),
          ));
        });
  }

  void confirmAction() async{
    bool isCorrect = this.situationBloc.validateAnswer();
    await Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>
                AnswerFeedBack(positive: isCorrect )));
    if(isCorrect){
      this.situationBloc.next(context, classBloc);
    }
  }
}

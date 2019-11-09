import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/widgets.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/model/Option.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/model/SituationOptions.dart';
import 'package:lexus/app/repositories/SituationRepository.dart';
import 'package:rxdart/rxdart.dart';
import '../../class_bloc.dart';

class SituationBloc extends BlocBase {
  ClassAnswerBloc _answerBloc;
  SituationRepository _situationRepository;
  List<Situation> _situationsList = [];
  Option selectedWord;
  Situation _currentSituation;
  SituationOptions _rightAnswertOption;
  int currentIndex = 0;
  var _situationController = BehaviorSubject<Situation>();
  var _selectedWordController = BehaviorSubject<Option>();

  SituationBloc(this._answerBloc, this._situationRepository);

  Observable<Situation> get outSituation => this._situationController.stream;
  Sink<Situation> get inSituation => this._situationController.sink;

  Observable<Option> get outSelectedWord => this._selectedWordController.stream;
  Sink<Option> get inSelectedWord => this._selectedWordController.sink;

  bool validateAnswer() {
    this.currentIndex++;
    return this._rightAnswertOption.optionsId == this.selectedWord.id;
  }

  bool isLast(){
    return this.currentIndex == this._situationsList.length;
  }

  void loadSituations() async {
    this._situationsList = await this
        ._situationRepository
        .loadSituationsByPlaceAndActivity(
            this._answerBloc.userAnswer.classAcitviyId,
            this._answerBloc.userAnswer.placeId);
    this._loadCurrentSituation();
  }

  void changeSelected(int index) {
    this.selectedWord = this._currentSituation.options[index];
    this.inSelectedWord.add(this.selectedWord);
  }

  void _loadCurrentSituation() async {
    this._currentSituation = this._situationsList[currentIndex];
    this._rightAnswertOption = await this
        ._situationRepository
        .rightAnswerSituation(this._currentSituation);
    this._currentSituation.options.shuffle();
    this._situationController.add(this._currentSituation);
  }

  void next() {
    this._loadCurrentSituation();
  }
}

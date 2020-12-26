import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/widgets.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/model/Option.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/model/SituationAnswers.dart';
import 'package:lexus/app/model/SituationOptions.dart';
import 'package:lexus/app/repositories/ClassActivityAnswerRepository.dart';
import 'package:lexus/app/repositories/SituationRepository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';
import '../../class_bloc.dart';
import 'dart:convert';

class SituationBloc extends BlocBase {
  ClassAnswerBloc _answerBloc;
  SituationRepository _situationRepository;
  ClassActivityAnswerRepository _answerRepository;
  SituationBloc(
      this._answerBloc, this._situationRepository, this._answerRepository);

  List<Situation> _situationsList = [];
  List<SituationAnswer> _situatioAnswers = [];
  List<Option> _optionsList = [];
  Option selectedWord;
  Situation _currentSituation;
  SituationOptions _rightAnswertOption;
  int currentIndex = 0;
  bool _hasSelected;
  var _situationController = BehaviorSubject<Situation>();
  var _selectedWordController = BehaviorSubject<Option>();
  var _hasSelectedController = BehaviorSubject<bool>();
  var _optionsListController = BehaviorSubject<List<Option>>();
  int rightAnswers = 0;
  int wrongAnswers = 0;

  Observable<List<Option>> get outOptionsList =>
      this._optionsListController.stream;
  Sink<List<Option>> get inOptionsList => this._optionsListController.sink;

  Observable<Situation> get outSituation => this._situationController.stream;
  Sink<Situation> get inSituation => this._situationController.sink;

  Observable<Option> get outSelectedWord => this._selectedWordController.stream;
  Sink<Option> get inSelectedWord => this._selectedWordController.sink;

  Observable<bool> get hasSelected => this._hasSelectedController.stream;

  bool validateAnswer() {
    var isRight = this._rightAnswertOption.optionsId == this.selectedWord.id;
    if (isRight) {
      this.rightAnswers++;
    } else {
      this.wrongAnswers++;
    }

    this.currentIndex++;
    return isRight;
  }

  bool isLast() {
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
    if (this.selectedWord == null) {
      this._hasSelectedController.add(true);
    }

    this.selectedWord = this._currentSituation.options[index];
    this.inSelectedWord.add(this.selectedWord);
  }

  void _loadCurrentSituation() async {
    this._hasSelectedController.add(null);
    this.selectedWord = null;
    this._currentSituation = this._situationsList[currentIndex];
    this._rightAnswertOption = await this
        ._situationRepository
        .rightAnswerSituation(this._currentSituation);
    this._currentSituation.options.shuffle();
    this._situationController.add(this._currentSituation);
  }

  void next() {
    this.saveSituation();
    this._loadCurrentSituation();
  }

  Future<void> finishClass() async {
    this._answerBloc.userAnswer.endTime = DateTime.now();
    this.saveSituation();
    this._answerBloc.userAnswer.situationAnswers.addAll(_situatioAnswers);
    return await this._answerRepository.insert(this._answerBloc.userAnswer);
  }

  void saveSituation() {
    var x = Uuid().v1();
    SituationAnswer situationAnswer = SituationAnswer.make(
        x.toString(),
        this._answerBloc.userAnswer.id,
        this._currentSituation.id,
        this.selectedWord.id);
    _situatioAnswers.add(situationAnswer);
  }
}

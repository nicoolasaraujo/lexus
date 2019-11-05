import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../class_bloc.dart';

class SituationBloc extends BlocBase {
  Observable<Situation> get outSituation => this._situationController.stream;
  Sink<Situation> get inSituation => this._situationController.sink;

  Observable<String> get outSelectedWord => this._selectedWordController.stream;
  Sink<String> get inSelectedWord => this._selectedWordController.sink;

  bool validateAnswer() {
    return this.selectedWord == this._currentSituation.correctWord;
  }

  bool isLast() {
    return this._situationsList.indexOf(this._currentSituation) ==
        (this._situationsList.length - 1);
  }

  List<Situation> _situationsList = [];
  String selectedWord;
  Situation _currentSituation;
  int currentIndex = 0;
  var _situationController = BehaviorSubject<Situation>();
  var _selectedWordController = BehaviorSubject<String>();

  void loadSituations() {
    this._situationsList = [
      Situation(1, "Primeira situação",
          <String>["Tubarão", "Tomate", "Hulk", "Marvel"], "Tomate"),
      Situation(2, "Segunda situação",
          <String>["Batata", "Boi", "Amizade", "Avestruz"], "Batata"),
    ];
    this.currentIndex = 0;
    this._currentSituation = this._situationsList[currentIndex];
    this._situationController.add(this._currentSituation);
    
  }


  changeSelected(int index) {
    this.selectedWord = this._currentSituation.randomWords[index];
    this.inSelectedWord.add(selectedWord);
  }

  void next(BuildContext context, ClassAnswerBloc clsbloc) {
    this.currentIndex++;
    if (currentIndex == this._situationsList.length){
      clsbloc.increaseProgress();
      Timer(const Duration(milliseconds: 3000), (){
        Navigator.of(context, rootNavigator: true).pop();
      });
      this.inSituation.add(null);
    }
    else{
      clsbloc.increaseProgress();
      this._currentSituation =  this._situationsList[currentIndex];
      this.inSituation.add(this._currentSituation);

      this.selectedWord = '';
      this.inSelectedWord.add(selectedWord); 
    }
  }
}

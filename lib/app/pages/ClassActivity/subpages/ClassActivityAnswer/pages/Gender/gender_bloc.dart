import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

import '../../class_bloc.dart';

class GenderBloc extends BlocBase {
  ClassAnswerBloc _answerBloc;
  GenderBloc(this._answerBloc);

  List<Gender> genderList = []; 
  Gender _currentGender;

  var _genders = BehaviorSubject<List<Gender>>();
  var _selectedGender = BehaviorSubject<Gender>();
  var _hasSelected = BehaviorSubject<bool>();

  void loadGender()async{
    this.genderList = [Gender(0, "Masculino", "assets/img/man.png"), Gender(1, "Feminino", "assets/img/woman.png") ];
    this.inGenderList.add(this.genderList);
  }

  void changeSelectedGender(int index){
    if(this._currentGender == null){
      this._hasSelected.sink.add(true);
    }

    this._currentGender =  this.genderList[index];
    this.inSelectedGender.add(this._currentGender);
  }

  Observable<List<Gender>> get outGenderList => this._genders.stream;
  Sink<List<Gender>> get inGenderList => this._genders.sink;

  Observable<Gender> get outSelectedGender => this._selectedGender.stream;
  Sink<Gender> get inSelectedGender => this._selectedGender.sink;

  Observable<bool> get outHasSelected => this._hasSelected.stream;

  void nextScreen(Function navigateNext){
    this._answerBloc.userAnswer.genderId = this._currentGender.id;
    navigateNext();
  }
  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    this._genders.sink.close();
    this._selectedGender.sink.close();
    super.dispose();
  }
}


class Gender {
  int id;
  String description;
  String imgPath;

  Gender(this.id, this.description, this.imgPath);
}

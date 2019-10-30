import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class GenderBloc extends BlocBase {

  List<Gender> genderList = [];
  var _genders = BehaviorSubject<List<Gender>>();
  var _selectedGender = BehaviorSubject<Gender>();

  // = [Gender(0, "Masculino", "assets/img/man.png"), Gender(1, "Feminino", "assets/img/woman.png") ];
  void loadGender(){
    this.genderList = [Gender(0, "Masculino", "assets/img/man.png"), Gender(1, "Feminino", "assets/img/woman.png") ];
    this.inGenderList.add(this.genderList);
  }

  void changeSelectedGender(int index){
    var x = this.genderList[index];
    this.inSelectedGender.add(x);
  }

  Observable<List<Gender>> get outGenderList => this._genders.stream;
  Sink<List<Gender>> get inGenderList => this._genders.sink;

  Observable<Gender> get outSelectedGender => this._selectedGender.stream;
  Sink<Gender> get inSelectedGender => this._selectedGender.sink;


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

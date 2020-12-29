import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/model/Student.dart';
import 'package:rxdart/rxdart.dart';

class StudentHomeBloc extends BlocBase {
  Student student;
  StudentHomeBloc(this.student);
  ThemeData _themeData = ThemeData.light();

  var _themeDataController = BehaviorSubject<ThemeData>();
  Sink<ThemeData> get inThemeData => this._themeDataController.sink;
  Observable<ThemeData> get outThemeData => this._themeDataController.stream;

  @override
  void dispose() {
    super.dispose();
  }

  void changeTheme() {
    this.inThemeData.add(ThemeData.dark());
  }

  void loadAllStudents() {}
}

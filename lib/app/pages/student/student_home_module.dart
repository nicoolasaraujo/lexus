import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/model/Student.dart';
import 'package:lexus/app/pages/student/student_home_bloc.dart';
import 'package:lexus/app/pages/student/student_home_page.dart';

class StudentHomeModule extends ModuleWidget {
  Student student;
  StudentHomeModule(this.student);

  @override
  List<Bloc> get blocs => [Bloc((i) => StudentHomeBloc(this.student))];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => StudentHomePage();

  static Inject get to => Inject<StudentHomeModule>.of();
}

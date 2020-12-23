import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/pages/student/student_home_bloc.dart';
import 'package:lexus/app/pages/student/student_home_page.dart';

class StudentHomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [Bloc((i) => StudentHomeBloc())];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => StudentHomePage();

  static Inject get to => Inject<StudentHomeModule>.of();
}

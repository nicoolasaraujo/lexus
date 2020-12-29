import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/pages/student/student_home_bloc.dart';
import 'package:lexus/app/pages/student/student_home_page.dart';

class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => StudentHomePage();

  static Inject get to => Inject<LoginModule>.of();
}

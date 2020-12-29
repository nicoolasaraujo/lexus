import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/app_module.dart';
import 'package:lexus/app/pages/teacher/classrooms/classroom_bloc.dart';
import 'package:lexus/app/pages/teacher/classrooms/register/classroom_register_bloc.dart';
import 'package:lexus/app/pages/teacher/classrooms/register/classroom_register_page.dart';
import 'package:lexus/app/repositories/ClassroomRepository.dart';

import '../../../app_bloc.dart';
import 'home_bloc.dart';
import 'home_page.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc(AppModule.to.getBloc<AppBloc>())),
        Bloc((i) => ClassroomBloc(HomeModule.to.getBloc<HomeBloc>(),
            HomeModule.to.getDependency<ClassroomRepository>())),
        Bloc((i) => ClassroomRegisterBloc(HomeModule.to.getBloc<HomeBloc>(),
            HomeModule.to.getDependency<ClassroomRepository>()))
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) =>
            ClassroomRepository(AppModule.to.getDependency<SqfliteAdapter>()))
      ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}

import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/app_widget.dart';
import 'package:lexus/app/data/DatabaseHelper.dart';
import 'package:lexus/app/repositories/TeacherRepository.dart';
import 'package:lexus/app/shared/constants.dart';

import 'pages/account/login_bloc.dart';
import 'pages/account/register/teacher_register_bloc.dart';

class AppModule extends ModuleWidget {
  Future initDatabase() async {
    await DatabaseHelper().createDatabase();
  }

  @override
  List<Bloc> get blocs => [
        Bloc(
          (i) => AppBloc(),
        ),
        Bloc((i) => LoginBloc(AppModule.to.getDependency<TeacherRepository>(),
            AppModule.to.getBloc<AppBloc>())),
        Bloc((i) => TeacherRegisterBloc(
            AppModule.to.getDependency<TeacherRepository>(),
            AppModule.to.getBloc<AppBloc>())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) =>
            SqfliteAdapter(DatabaseHelper.dbPath, version: DATABASE_VERSION)),
        Dependency((i) =>
            TeacherRepository(AppModule.to.getDependency<SqfliteAdapter>()))
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

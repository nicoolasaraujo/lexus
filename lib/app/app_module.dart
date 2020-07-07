import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/app_widget.dart';
import 'package:lexus/app/data/DatabaseHelper.dart';
import 'package:lexus/app/shared/constants.dart';

class AppModule extends ModuleWidget {

  Future initDatabase() async {
    await DatabaseHelper().createDatabase();
  }

  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => SqfliteAdapter(DatabaseHelper.dbPath, version: DATABASE_VERSION))
  ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

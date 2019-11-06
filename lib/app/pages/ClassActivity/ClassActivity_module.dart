import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/app_module.dart';
import 'package:lexus/app/pages/ClassActivity/ClassActivity_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/pages/ClassActivity/ClassActivity_page.dart';
import 'package:lexus/app/repositories/ClassActivityRepository.dart';

class ClassActivityModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ClassActivityBloc(ClassActivityModule.to.getDependency<ClassActivityRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => ClassActivityRepository(AppModule.to.getDependency<SqfliteAdapter>()))
  ];

  @override
  Widget get view => ClassActivityPage();

  static Inject get to => Inject<ClassActivityModule>.of();
}

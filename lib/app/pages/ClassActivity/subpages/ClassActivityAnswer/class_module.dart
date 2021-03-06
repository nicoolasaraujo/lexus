import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/app_module.dart';
import 'package:lexus/app/pages/ClassActivity/ClassActivity_bloc.dart';
import 'package:lexus/app/pages/ClassActivity/subpages/ClassActivityAnswer/pages/FinishedClass/finishedClass_bloc.dart';
import 'package:lexus/app/repositories/ClassActivityAnswerRepository.dart';
import 'package:lexus/app/repositories/ClothesRepository.dart';
import 'package:lexus/app/repositories/PlaceRepository.dart';
import 'package:lexus/app/repositories/SituationRepository.dart';
import '../../ClassActivity_module.dart';
import 'class_bloc.dart';
import 'class_page.dart';
import 'pages/Clothes/clothes_bloc.dart';
import 'pages/Gender/gender_bloc.dart';
import 'pages/Place/place_bloc.dart';
import 'pages/Situation/situation_bloc.dart';


class ClassAnswerModule extends ModuleWidget {
  ClassAnswerModule();
  @override
  List<Bloc> get blocs => [
        Bloc((i) => GenderBloc(ClassAnswerModule.to.getBloc<ClassAnswerBloc>())),
        Bloc((i) => PlaceBloc(ClassAnswerModule.to.getBloc<ClassAnswerBloc>(), ClassAnswerModule.to.getDependency<PlaceRepository>())),
        Bloc((i) => ClothesBloc(ClassAnswerModule.to.getBloc<ClassAnswerBloc>(), ClassAnswerModule.to.getDependency<ClothesRepository>())),
        Bloc((i) => SituationBloc(ClassAnswerModule.to.getBloc<ClassAnswerBloc>(), ClassAnswerModule.to.getDependency<SituationRepository>(), ClassAnswerModule.to.getDependency<ClassActivityAnswerRepository>())),
        Bloc((i) => ClassAnswerBloc(ClassActivityModule.to.getBloc<ClassActivityBloc>(), ClassAnswerModule.to.getDependency<SituationRepository>())),
        Bloc((i) => FinishedClassBloc(ClassAnswerModule.to.getBloc<ClassAnswerBloc>(),ClassAnswerModule.to.getDependency<ClassActivityAnswerRepository>() ))
      ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => SituationRepository(AppModule.to.getDependency<SqfliteAdapter>())),
    Dependency((i) => ClothesRepository(AppModule.to.getDependency<SqfliteAdapter>())),
    Dependency((i) => ClassActivityAnswerRepository(AppModule.to.getDependency<SqfliteAdapter>())),
    Dependency((i) => PlaceRepository(AppModule.to.getDependency<SqfliteAdapter>()))
  ];

  @override
  Widget get view => ClassAnswerPage();

  static Inject get to => Inject<ClassAnswerModule>.of();
}

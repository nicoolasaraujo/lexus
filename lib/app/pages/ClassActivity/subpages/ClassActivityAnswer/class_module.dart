import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'class_bloc.dart';
import 'class_page.dart';
import 'pages/Clothes/clothes_bloc.dart';
import 'pages/Gender/gender_bloc.dart';
import 'pages/Place/place_bloc.dart';
import 'pages/Situation/situation_bloc.dart';


class ClassAnswerModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => GenderBloc()),
        Bloc((i) => PlaceBloc()),
        Bloc((i) => ClothesBloc()),
        Bloc((i) => SituationBloc()),
        Bloc((i) => ClassAnswerBloc())
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ClassAnswerPage();

  static Inject get to => Inject<ClassAnswerModule>.of();
}

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/pages/ClassActivity/class_bloc.dart';
import 'package:lexus/app/pages/ClassActivity/class_page.dart';
import 'package:lexus/app/pages/ClassActivity/pages/Clothes/Clothes_bloc.dart';
import 'package:lexus/app/pages/ClassActivity/pages/Gender/gender_bloc.dart';
import 'package:lexus/app/pages/ClassActivity/pages/Place/place_bloc.dart';
import 'package:lexus/app/pages/ClassActivity/pages/Situation/situation_bloc.dart';


class ClassModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => GenderBloc()),
        Bloc((i) => PlaceBloc()),
        Bloc((i) => ClothesBloc()),
        Bloc((i) => SituationBloc()),
        Bloc((i) => ClassActivityBloc())
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ClassPage();

  static Inject get to => Inject<ClassModule>.of();
}

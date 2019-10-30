import 'package:lexus/app/pages/ClassActivity/class_bloc.dart';
import 'package:lexus/app/pages/Gender/gender_bloc.dart';
import 'package:lexus/app/pages/Place/place_bloc.dart';
import 'package:lexus/app/pages/home/home_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/pages/home/home_page.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc()),
        Bloc((i) => GenderBloc()),
        Bloc((i) => PlaceBloc()),
        Bloc((i) => ClassActivityBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}

import 'package:lexus/app/pages/ClassActivity/ClassActivity_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/pages/ClassActivity/ClassActivity_page.dart';

class ClassActivityModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ClassActivityBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ClassActivityPage();

  static Inject get to => Inject<ClassActivityModule>.of();
}

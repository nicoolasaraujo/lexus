import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lexus/app/pages/student/settings/settings_page.dart';
import 'package:lexus/app/pages/student/student_home_page.dart';

import 'settings_bloc.dart';

class SettingsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [Bloc((i) => SettingsBloc())];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => SettingsPage();

  static Inject get to => Inject<SettingsModule>.of();
}

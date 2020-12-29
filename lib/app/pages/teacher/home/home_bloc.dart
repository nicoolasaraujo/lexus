import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/model/Teacher.dart';

import '../../../app_bloc.dart';

class HomeBloc extends BlocBase {
  AppBloc _appBloc;
  HomeBloc(this._appBloc);

  Teacher get currentTeacher => this._appBloc.teacher;

  @override
  void dispose() {
    super.dispose();
  }
}

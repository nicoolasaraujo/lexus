import 'package:bloc_pattern/bloc_pattern.dart';

import 'model/Teacher.dart';

class AppBloc extends BlocBase {
  Teacher teacher;

  @override
  void dispose() {
    super.dispose();
  }
}

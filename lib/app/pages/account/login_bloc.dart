import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/app_bloc.dart';
import 'package:lexus/app/model/Teacher.dart';
import 'package:lexus/app/repositories/TeacherRepository.dart';

class LoginBloc extends BlocBase {
  TeacherRepository _repoTeacher;
  AppBloc _appBloc;
  LoginBloc(this._repoTeacher, this._appBloc);

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> validateLogin(String username, String password) async {
    Teacher returnedTeacher =
        await this._repoTeacher.validateLogin(username, password);

    if (returnedTeacher == null) {
      return false;
    } else {
      this._appBloc.teacher = returnedTeacher;
      return true;
    }
  }
}

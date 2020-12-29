import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/model/Teacher.dart';
import 'package:lexus/app/repositories/TeacherRepository.dart';

import '../../../app_bloc.dart';

class TeacherRegisterBloc extends BlocBase {
  AppBloc _appBloc;
  TeacherRepository _repoTeacher;
  TeacherRegisterBloc(this._repoTeacher, this._appBloc);
  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> createTeacher(Teacher teacherToInsert) async {
    try {
      var returnedValue = await this._repoTeacher.insert(teacherToInsert);
      if (returnedValue > 0) {
        this._appBloc.teacher = teacherToInsert;
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}

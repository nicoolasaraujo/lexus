import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/data/Beans/TeacherBean.dart';
import 'package:lexus/app/model/Teacher.dart';

class TeacherRepository {
  SqfliteAdapter _adapter;
  TeacherBean _teacherBean;
  TeacherRepository(this._adapter) {
    this._teacherBean = TeacherBean(this._adapter);
  }

  Future<Teacher> validateLogin(String username, String password) async {
    try {
      if (this._adapter.connection == null ||
          !this._adapter.connection.isOpen) {
        await this._adapter.connect();
      }
      await this._adapter.connect();
      Find finder = this._teacherBean.finder;
      finder.and(this._teacherBean.username.eq(username));
      Teacher teacher = await this._teacherBean.findOne(finder);

      if (teacher != null && teacher.password == password) {
        return teacher;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  Future<dynamic> insert(Teacher teacher) async {
    if (this._adapter.connection == null || !this._adapter.connection.isOpen) {
      await this._adapter.connect();
    }
    return await this._teacherBean.insert(teacher);
  }
}

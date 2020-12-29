import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/model/classActivity.dart';

class ClassActivityRepository {
  SqfliteAdapter _adapter;
  ClassActivityBean _bean;
  ClassActivityRepository(this._adapter) {
    this._bean = ClassActivityBean(this._adapter);
  }

  Future<List<ClassActivity>> getAll() async {
    await this._adapter.connect();
    try {
      var response = await this._bean.getAll();
      for (ClassActivity elem in response) {
        var teach = await this._bean.teacherBean.find(elem.teacherId);
        elem.setTeacher(teach);
      }
      return response;
    } catch (error) {
      return throw error;
    }
  }

  getTodoClassesAll(String studentId) async {
    await this._adapter.connect();
    List<ClassActivity> activities = [];
    var x = await this._adapter.connection.rawQuery(
        "SELECT * FROM ${this._bean.tableName} class WHERE NOT EXISTS (SELECT 1 FROM ${this._bean.classActivityAnswerBean.tableName} answers where ${this._bean.classActivityAnswerBean.classAcitviyId.name} = class.id and ${this._bean.classActivityAnswerBean.studentId.name} = '${studentId}')");
    activities =
        x.toList().map((item) => ClassActivity.fromJson(item)).toList();
    for (ClassActivity elem in activities) {
      var teacher = await this._bean.teacherBean.find(elem.teacherId);
      elem.setTeacher(teacher);
    }

    return activities;
  }

  getFinishedClasses(String studentId) async {
    await this._adapter.connect();
    List<ClassActivity> activities = [];
    var x = await this._adapter.connection.rawQuery(
        "SELECT * FROM ${this._bean.tableName} class WHERE EXISTS (SELECT 1 FROM ${this._bean.classActivityAnswerBean.tableName} answers where ${this._bean.classActivityAnswerBean.classAcitviyId.name} = class.id and ${this._bean.classActivityAnswerBean.studentId.name} = '${studentId}')");
    activities =
        x.toList().map((item) => ClassActivity.fromJson(item)).toList();
    for (ClassActivity elem in activities) {
      var teacher = await this._bean.teacherBean.find(elem.teacherId);
      elem.setTeacher(teacher);
    }

    return activities;
  }

  remveAll() {
    this._bean.classActivityAnswerBean.situationAnswerBean.removeAll();
    this._bean.classActivityAnswerBean.removeAll();
  }
}

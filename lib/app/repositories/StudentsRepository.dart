import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/StudentBean.dart';
import 'package:lexus/app/model/Student.dart';

class StudentRepository {
  SqfliteAdapter _adapter;
  StudentBean _studentBean;

  StudentRepository(this._adapter) {
    this._studentBean = StudentBean(this._adapter);
  }

  Future<List<Student>> getStudenstByTeacher(String teacherId) async {
    await this._adapter.connect();
    List<Student> classes = [];
    var reusltQuery = await this._adapter.connection.rawQuery(
        "SELECT * FROM ${this._studentBean.tableName} where ${this._studentBean.id.name} = '1' or ${this._studentBean.classRoomId.name} IN (SELECT ${this._studentBean.classroomBean.teacherId.name} FROM ${this._studentBean.classroomBean.tableName} WHERE ${this._studentBean.classroomBean.teacherId.name} = '${teacherId}')");

    classes = reusltQuery
        .toList()
        .map((item) => this._studentBean.fromMap(item))
        .toList();

    return classes;
  }
}

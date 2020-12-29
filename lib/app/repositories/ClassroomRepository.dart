import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/ClassroomBean.dart';
import 'package:lexus/app/model/ClassRoom.dart';

class ClassroomRepository {
  SqfliteAdapter _adapter;
  ClassroomBean _classroomBean;

  ClassroomRepository(this._adapter) {
    this._classroomBean = ClassroomBean(this._adapter);
  }

  getClassesByTeacher(String teacherId) async {
    await this._adapter.connect();
    List<Classroom> classes = [];
    var reusltQuery = await this._adapter.connection.rawQuery(
        "SELECT * FROM ${this._classroomBean.tableName} where ${this._classroomBean.teacherId.name} = '${teacherId}' ");
    ;

    classes = reusltQuery
        .toList()
        .map((item) => this._classroomBean.fromMap(item))
        .toList();

    return classes;
  }
}

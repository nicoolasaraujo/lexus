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
      for (ClassActivity elem in response){
        var teach = await this._bean.teacherBean.find(elem.teacherId);
        elem.setTeacher(teach);
      }
      return response;
      
    } catch (error) {
      return throw error;
    }
  }
}

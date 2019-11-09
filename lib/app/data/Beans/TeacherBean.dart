import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/ClassroomBean.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/Teacher.dart';
import 'package:lexus/app/model/classActivity.dart';
part 'TeacherBean.jorm.dart';

@GenBean()
class TeacherBean extends Bean<Teacher> with _TeacherBean {
  TeacherBean(Adapter adapter) 
  : classActivityBean = ClassActivityBean(adapter),
   super (adapter);

  final ClassActivityBean classActivityBean;
  
  ClassroomBean _classroomBean;

  ClassroomBean get classroomBean {
    this._classroomBean ??= ClassroomBean(adapter);
    return this._classroomBean;
  }

  @override
  String get tableName => 'Teacher';
}
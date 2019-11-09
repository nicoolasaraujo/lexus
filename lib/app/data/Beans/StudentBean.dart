import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/ClassroomBean.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/Student.dart';

part 'StudentBean.jorm.dart';
 
@GenBean()
class StudentBean extends Bean<Student> with _StudentBean {

  StudentBean(Adapter adapter) 
  : this.classActivityAnswerBean = ClassActivityAnswerBean(adapter),
   super(adapter);
  ClassroomBean _classroomBean;

  ClassroomBean get classroomBean => _classroomBean ??= new ClassroomBean(adapter);
  
  final ClassActivityAnswerBean classActivityAnswerBean;

  final String tableName = 'Students';
}

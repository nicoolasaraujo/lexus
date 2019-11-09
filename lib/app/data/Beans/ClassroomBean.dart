import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/StudentBean.dart';
import 'package:lexus/app/data/Beans/TeacherBean.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/Student.dart';
import 'package:lexus/app/model/Teacher.dart';
import 'package:lexus/app/model/classActivity.dart';
part 'ClassroomBean.jorm.dart';

@GenBean()
class ClassroomBean extends Bean<Classroom> with _ClassroomBean {
  ClassroomBean(Adapter adapter)
      : studentBean = StudentBean(adapter),
        classActivityBean = ClassActivityBean(adapter),
        super(adapter);

  final StudentBean studentBean;
  final ClassActivityBean classActivityBean;
  
  TeacherBean _teacher;
  TeacherBean get teacherBean => this._teacher ??= new TeacherBean(adapter);

  final String tableName = 'Classrooms';
}

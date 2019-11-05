import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/StudentBean.dart';
import 'package:lexus/app/data/Beans/TeacherBean.dart';
import 'package:lexus/app/model/Student.dart';
import 'package:lexus/app/model/classActivity.dart';

class Classroom {
  Classroom();

  Classroom.make(this.id, this.description);

  @PrimaryKey()
  String id;

  String description;

  @HasMany(StudentBean)
  List<Student> students;

  @BelongsTo(TeacherBean)
  String teacherId;

  @HasMany(ClassActivityBean)
  List<ClassActivity> classActivities;
}

import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/StudentBean.dart';
import 'package:lexus/app/data/Beans/TeacherBean.dart';
import 'package:lexus/app/model/Student.dart';
import 'package:lexus/app/model/Teacher.dart';
import 'package:lexus/app/model/classActivity.dart';

class Classroom {
  Classroom();

  Classroom.make(this.id, this.description, this._teacher);
  Classroom.makeTeacherId(this.id, this.description, this.teacherId);

  @PrimaryKey()
  String id;

  String description;

  @IgnoreColumn()
  String extraInfo;

  @HasMany(StudentBean)
  List<Student> students;

  @BelongsTo(TeacherBean)
  String teacherId;

  @IgnoreColumn()
  Teacher _teacher;

  @HasMany(ClassActivityBean)
  List<ClassActivity> classActivities;

  @IgnoreColumn()
  Teacher get teacher => this._teacher;

  void setTeacher(Teacher teacher) {
    this._teacher = teacher;
    this.teacherId = this._teacher.id;
  }

  @override
  String toString() {
    return "Id: ${this.id} Teacher: Name${teacher.description}, ${teacher.emailAddres}";
  }
}

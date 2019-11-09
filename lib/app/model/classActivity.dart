import 'package:intl/intl.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/ClassSituationBean.dart';
import 'package:lexus/app/data/Beans/ClassroomBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/data/Beans/TeacherBean.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';
import 'package:lexus/app/model/Situation.dart';

import 'Teacher.dart';

class ClassActivity{
  ClassActivity();

  @PrimaryKey()
  String id;
  String description;
  DateTime activityDay;
  int status;

  @BelongsTo(TeacherBean)
  String teacherId;

  @BelongsTo(ClassroomBean)
  String classroomId;

  @ManyToMany(ClassSituationBean, SituationBean)
  List<Situation> situations;

  @HasMany(ClassActivityAnswerBean)
  List<ClassActivityAnswer> answer;


  @IgnoreColumn()
  Teacher _teacher;

  @IgnoreColumn()
  Teacher get teacher => this._teacher;

  void setTeacher(Teacher teacher){
    this._teacher = teacher;
    this.teacherId = this._teacher.id;
  }

  
  String activityDateFormatted(){
    var formatted = DateFormat('dd/MM/yyyy');
    return formatted.format(this.activityDay);
  }

  ClassActivity.make(this.id, this.description, this.activityDay, this.status, this.classroomId, this.teacherId);
}

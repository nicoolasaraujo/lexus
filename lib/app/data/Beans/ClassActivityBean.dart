import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/ClassSituationBean.dart';
import 'package:lexus/app/data/Beans/ClassroomBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/data/Beans/TeacherBean.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/Teacher.dart';
import 'package:lexus/app/model/classActivity.dart';

part 'ClassActivityBean.jorm.dart';

@GenBean()
class ClassActivityBean extends Bean<ClassActivity> with _ClassActivityBean {
  ClassActivityBean(Adapter adapter)
      : this._classSituation = ClassSituationBean(adapter),
        this._situation = SituationBean(adapter),
        this.classActivityAnswerBean = ClassActivityAnswerBean(adapter),
      super(adapter);

  TeacherBean _teacherBean;
  ClassroomBean _classroomBean;

  TeacherBean get teacherBean => this._teacherBean??= TeacherBean(adapter);
  ClassroomBean get classroomBean => this._classroomBean??= ClassroomBean(adapter);


  ClassSituationBean _classSituation;
  SituationBean _situation;

  ClassSituationBean get classSituationBean => this._classSituation;
  SituationBean get situationBean => this._situation;

  final ClassActivityAnswerBean classActivityAnswerBean;


  @override
  String get tableName => 'ClassActivity';

}

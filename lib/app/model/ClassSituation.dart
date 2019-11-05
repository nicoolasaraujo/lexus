import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';

class ClassSituation {
  ClassSituation();

  @BelongsTo.many(ClassActivityBean)  
  String classId;

  @BelongsTo.many(SituationBean)
  String situationId;
}

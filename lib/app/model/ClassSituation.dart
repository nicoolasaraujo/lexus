import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';

class ClassSituation {
  ClassSituation();

  ClassSituation.make(this.classId, this.situationId);

  @BelongsTo.many(ClassActivityBean)  
  String classId;

  @BelongsTo.many(SituationBean)
  String situationId;
}

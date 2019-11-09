
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/model/ClassSituation.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/model/classActivity.dart';

part 'ClassSituationBean.jorm.dart';

@GenBean()
class ClassSituationBean extends Bean<ClassSituation> with _ClassSituationBean {
  ClassSituationBean(Adapter adapter)
  :super(adapter);

  ClassActivityBean _classActivityBean;
  SituationBean _situationBean;

  ClassActivityBean get classActivityBean {
    this._classActivityBean ??= ClassActivityBean(adapter);
    return this._classActivityBean;
  }

  SituationBean get situationBean {
    this._situationBean ??= SituationBean(adapter);
    return this._situationBean;
  }

  @override
  String get tableName => 'ClassSituation';
}

import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/OptionBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';
import 'package:lexus/app/model/Option.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/model/SituationAnswers.dart';

part 'SituationAnswersBean.jorm.dart';

@GenBean()
class SituationAnswersBean extends Bean<SituationAnswer> with _SituationAnswersBean {
  SituationAnswersBean(Adapter adapter)
      :super(adapter);

  ClassActivityAnswerBean _classActivityAnswerBean;
  SituationBean _situationBean;
  OptionBean _optionBean;

  ClassActivityAnswerBean get classActivityAnswerBean => this._classActivityAnswerBean??=ClassActivityAnswerBean(adapter);

  SituationBean get situationBean => this._situationBean ??= SituationBean(adapter);

  OptionBean get optionBean => this._optionBean ??= OptionBean(adapter);

  @override
  // TODO: implement tableName
  String get tableName => 'SituatioAnswers';

}

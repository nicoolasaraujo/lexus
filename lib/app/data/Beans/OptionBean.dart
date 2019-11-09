import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/SituationAnswersBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/data/Beans/SituationOptionsBean.dart';
import 'package:lexus/app/model/Option.dart';
import 'package:lexus/app/model/SituationAnswers.dart';

part 'OptionBean.jorm.dart';

@GenBean()
class OptionBean extends Bean<Option> with _OptionBean {
  OptionBean(Adapter adapter)
  :super(adapter);

  SituationBean _situationBean;
  SituationOptionsBean _situationOptions;

  SituationBean get situationBean {
    this._situationBean ??= SituationBean(adapter);
    return this._situationBean;
  }

  SituationOptionsBean get situationOptionsBean {
    this._situationOptions ??= SituationOptionsBean(adapter);
    return this._situationOptions;
  }

  SituationAnswersBean _situationAnswerBean;
  @override
  String get tableName => 'Option';

  @override
  SituationAnswersBean get situationAnswerBean => this._situationAnswerBean ??= SituationAnswersBean(adapter);
  
}

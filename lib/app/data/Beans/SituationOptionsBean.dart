import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/OptionBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/model/Option.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/model/SituationOptions.dart';

part 'SituationOptionsBean.jorm.dart';

@GenBean()
class SituationOptionsBean extends Bean<SituationOptions> with _SituationOptionsBean {
  SituationOptionsBean(Adapter adapter)
  :super(adapter);

  SituationBean _situationBean;
  OptionBean _optionBean;

  OptionBean get optionBean {
    this._optionBean ??= OptionBean(adapter);
    return this._optionBean;
  }

  SituationBean get situationBean {
    this._situationBean ??= SituationBean(adapter);
    return this._situationBean;
  }

  @override
  String get tableName => 'SituationOptions';
}

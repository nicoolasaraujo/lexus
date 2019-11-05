import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/ClassSituationBean.dart';
import 'package:lexus/app/data/Beans/OptionBean.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';
import 'package:lexus/app/data/Beans/SituationAnswersBean.dart';
import 'package:lexus/app/data/Beans/SituationOptionsBean.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/model/SituationAnswers.dart';
import 'package:lexus/app/model/place.dart';

part 'SituationBean.jorm.dart';

@GenBean()
class SituationBean extends Bean<Situation> with _SituationBean {
  SituationBean(Adapter adapter)
  :super(adapter);

  PlaceBean _placeBean;
  ClassActivityBean _classActivityBean;
  ClassSituationBean _classSituationBean;

  ClassActivityBean get classActivityBean => this._classActivityBean ??= ClassActivityBean(adapter);
  ClassSituationBean get classSituationBean  => this._classSituationBean ??= ClassSituationBean(adapter);
  
  @override
  PlaceBean get placeBean => this._placeBean ??= PlaceBean(adapter);

  OptionBean _optionBean;
  SituationOptionsBean _situationOptions;

  OptionBean get optionBean {
    this._optionBean ??= OptionBean(adapter);
    return this._optionBean;
  }

  SituationOptionsBean get situationOptionsBean {
    this._situationOptions ??= SituationOptionsBean(adapter);
    return this._situationOptions;
  }
  
  @override
  String get tableName => 'Situation';

  SituationAnswersBean _situationAnswerBean;

  @override
  SituationAnswersBean get situationAnswerBean => this._situationAnswerBean ??= SituationAnswersBean(adapter);
}

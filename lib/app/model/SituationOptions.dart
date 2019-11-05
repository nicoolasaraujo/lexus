import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/OptionBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';

class SituationOptions{
  SituationOptions();

  SituationOptions.make(this.situationId, this.optionsId, this.rigthAnswer);

  @BelongsTo.many(SituationBean)
  String situationId;

  @BelongsTo.many(OptionBean)
  String optionsId;

  bool rigthAnswer;
}

import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/OptionBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';

class SituationAnswer{

  SituationAnswer();

  SituationAnswer.make(this.id, this.acitivityAnswerId,this.situationid, this.optionId);

  @PrimaryKey()
  String id;

  @BelongsTo(ClassActivityAnswerBean)
  String acitivityAnswerId;

  @BelongsTo(SituationBean)
  String situationid;

  @BelongsTo(OptionBean)
  String optionId;
}
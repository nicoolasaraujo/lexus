import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/OptionBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';

class SituationAnswer{
  @PrimaryKey()
  String id;

  @BelongsTo(ClassActivityAnswerBean)
  String acitivityAnswerId;

  @BelongsTo(SituationBean)
  String situationid;

  @BelongsTo(OptionBean)
  String optionId;
}
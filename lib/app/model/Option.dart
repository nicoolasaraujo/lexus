import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/SituationAnswersBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/data/Beans/SituationOptionsBean.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/model/SituationAnswers.dart';

class Option {
  Option();

  Option.make(this.id, this.description);

  @PrimaryKey()
  String id;
  String description;

  @ManyToMany(SituationOptionsBean, SituationBean)
  List<Situation> situations;

  @HasMany(SituationAnswersBean)
  List<SituationAnswer> situationsAnswers;
}

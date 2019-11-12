import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/ClassSituationBean.dart';
import 'package:lexus/app/data/Beans/OptionBean.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';
import 'package:lexus/app/data/Beans/SituationAnswersBean.dart';
import 'package:lexus/app/data/Beans/SituationOptionsBean.dart';
import 'package:lexus/app/model/Option.dart';
import 'package:lexus/app/model/SituationAnswers.dart';
import 'package:lexus/app/model/classActivity.dart';

class Situation {
  Situation();

  Situation.make(this.id, this.title, this.question, this.placeId, {this.situationType = 0});

  @PrimaryKey()
  String id;

  String title;
  String question;
  int situationType;

  @BelongsTo(PlaceBean)
  String placeId;

  @ManyToMany(ClassSituationBean, ClassActivityBean)
  List<ClassActivity> classAcitivty;

  @ManyToMany(SituationOptionsBean, OptionBean)
  List<Option> options;

  @HasMany(SituationAnswersBean)
  List<SituationAnswer> situationsAnswers;
}

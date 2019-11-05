import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/ClothesBean.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';
import 'package:lexus/app/data/Beans/SituationAnswersBean.dart';
import 'package:lexus/app/data/Beans/StudentBean.dart';
import 'package:lexus/app/model/SituationAnswers.dart';

class ClassActivityAnswer {
  @PrimaryKey()
  String id;
  DateTime initialTime;
  DateTime endTime;

  @BelongsTo(ClassActivityBean)
  String classAcitviyId;

  @BelongsTo(ClothesBean)
  String clothesId;

  @BelongsTo(PlaceBean)
  String placeId;

  @BelongsTo(StudentBean)
  String studentId;

  @HasMany(SituationAnswersBean)
  List<SituationAnswer> situationAnswers;
}

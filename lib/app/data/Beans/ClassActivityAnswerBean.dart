import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/ClothesBean.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';
import 'package:lexus/app/data/Beans/SituationAnswersBean.dart';
import 'package:lexus/app/data/Beans/StudentBean.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';
import 'package:lexus/app/model/Clothes.dart';
import 'package:lexus/app/model/SituationAnswers.dart';
import 'package:lexus/app/model/Student.dart';
import 'package:lexus/app/model/classActivity.dart';
import 'package:lexus/app/model/place.dart';

part 'ClassActivityAnswerBean.jorm.dart';

@GenBean()
class ClassActivityAnswerBean extends Bean<ClassActivityAnswer> with _ClassActivityAnswerBean {
  ClassActivityAnswerBean(Adapter adapter)
      : this._situationAnswersBean = SituationAnswersBean(adapter),
      super(adapter);

  SituationAnswersBean _situationAnswersBean;

  ClassActivityBean _classActivityBean;
  ClothesBean _clothesBean;
  PlaceBean _placeBean;
  StudentBean _studentBean;

  ClassActivityBean get classActivityBean => this._classActivityBean ??= ClassActivityBean(adapter);
  ClothesBean get clothesBean => this._clothesBean ??= ClothesBean(adapter);
  PlaceBean get placeBean => this._placeBean ??= PlaceBean(adapter);
  StudentBean get studentBean => this._studentBean ??= StudentBean(adapter);
  

  final String tableName = 'ClassActivityAnswer';

  @override
  // TODO: implement situationAnswerBean
  SituationAnswersBean get situationAnswerBean => this._situationAnswersBean ??= SituationAnswersBean(adapter);
}

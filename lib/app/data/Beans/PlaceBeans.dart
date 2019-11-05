import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/ClothesBean.dart';
import 'package:lexus/app/data/Beans/PlaceClothesBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/model/place.dart';

part 'PlaceBeans.jorm.dart';

@GenBean()
class PlaceBean extends Bean<Place> with _PlaceBean {
  PlaceBean(Adapter adapter)
  : this._placeClothes = PlaceClothesBean(adapter),
   this._clothes = ClothesBean(adapter),
   this.classActivityAnswerBean = ClassActivityAnswerBean(adapter),
  super(adapter);

  ClothesBean _clothes;
  PlaceClothesBean _placeClothes;
  SituationBean _situationBean;

  @override
  ClothesBean get clothesBean => this._clothes;

  @override
  PlaceClothesBean get placeClothesBean => _placeClothes;

  final ClassActivityAnswerBean classActivityAnswerBean;

  @override
  String get tableName => 'Place';

  @override
  SituationBean get situationBean => _situationBean ??= SituationBean(adapter);
}

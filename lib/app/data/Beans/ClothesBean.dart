import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';
import 'package:lexus/app/data/Beans/PlaceClothesBean.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';
import 'package:lexus/app/model/Clothes.dart';


part 'ClothesBean.jorm.dart';

@GenBean()
class ClothesBean extends Bean<Clothes> with _ClothesBean {
  ClothesBean(Adapter adapter)
  : this.classActivityAnswerBean = ClassActivityAnswerBean(adapter),
  super(adapter);

  PlaceBean _place;
  PlaceClothesBean _placeClothes;

  PlaceClothesBean get placeClothesBean {
    this._placeClothes ??= PlaceClothesBean(adapter);
    return this._placeClothes;
  }

  PlaceBean get placeBean {
    this._place ??= PlaceBean(adapter);
    return this._place;
  }

  final ClassActivityAnswerBean classActivityAnswerBean;

  @override
  String get tableName => 'Clothes';
}

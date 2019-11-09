import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClothesBean.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';
import 'package:lexus/app/model/Clothes.dart';
import 'package:lexus/app/model/PlaceClothes.dart';
import 'package:lexus/app/model/place.dart';


part 'PlaceClothesBean.jorm.dart';

@GenBean()
class PlaceClothesBean extends Bean<PlaceClothes> with _PlaceClothesBean {
  PlaceClothesBean(Adapter adapter)
  :super(adapter);

  ClothesBean _clothesBean;
  PlaceBean _placeBean;

  PlaceBean get placeBean {
    this._placeBean ??= PlaceBean(adapter);
    return this._placeBean;
  }

  ClothesBean get clothesBean {
    this._clothesBean ??= ClothesBean(adapter);
    return this._clothesBean;
  }

  @override
  String get tableName => 'PlaceClothes';
}

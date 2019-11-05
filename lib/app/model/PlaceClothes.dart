import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClothesBean.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';

class PlaceClothes {
  PlaceClothes();

  @BelongsTo.many(PlaceBean)
  String placeId;

  @BelongsTo.many(ClothesBean)
  String clothesId;
}

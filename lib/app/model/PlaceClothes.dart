import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:lexus/app/data/Beans/ClothesBean.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';

class PlaceClothes {
  PlaceClothes();

  PlaceClothes.make(this.placeId, this.clothesId);

  @BelongsTo.many(PlaceBean)
  String placeId;

  @BelongsTo.many(ClothesBean)
  String clothesId;
}

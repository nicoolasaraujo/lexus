import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/ClothesBean.dart';
import 'package:lexus/app/model/Clothes.dart';
import 'package:lexus/app/model/PlaceClothes.dart';

class ClothesRepository {
  SqfliteAdapter _adapter;
  ClothesBean _clothesBean;

  ClothesRepository(this._adapter) {
    this._clothesBean = ClothesBean(this._adapter);
  }

  Future<List<Clothes>> findClothesByPlace(String placeId, int gender) async {
    await this._adapter.connect();
    Find find = this._clothesBean.finder;
    var clothes = await this
        ._clothesBean
        .placeClothesBean
        .findWhere(this._clothesBean.placeClothesBean.placeId.eq(placeId));

    for (PlaceClothes x in clothes) {
      find.or(this._clothesBean.id.eq(x.clothesId));
    }
    find.and(this._clothesBean.gender.eq(gender));
    return await this._clothesBean.findMany(find);
  }
}

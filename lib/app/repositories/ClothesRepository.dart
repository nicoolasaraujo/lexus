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

  Future<List<Clothes>> findClothesByPlace(String placeId) async {
    await this._adapter.connect();
    Find find = this._clothesBean.finder;
    var clothes = await this._clothesBean.placeClothesBean.findWhere(this._clothesBean.placeClothesBean.placeId.eq(placeId));

    for (PlaceClothes x in clothes){
      find.or(this._clothesBean.id.eq(x.clothesId));
    }

    return await this._clothesBean.findMany(find);

    // find
    //     .selAll()
    //     .selAll(this._clothesBean.placeClothesBean.tableName)
    //     .innerJoin(this._clothesBean.placeClothesBean.tableName)
    //     .joinOn(Field(this._clothesBean.id.name)
    //         .eqF(this._clothesBean.placeClothesBean.placeId.name))
    //     .where(
    //         Field(this._clothesBean.placeClothesBean.placeId.name).eq(placeId));
  }
}
    // await this._clothesBean.insert(Clothes.make2('6', 'Social','assets/img/cold.png', EnumGender.MALE.index));
    // await this._clothesBean.insert(Clothes.make2('7', 'Banho','assets/img/cold.png', EnumGender.MALE.index));
    // await this._clothesBean.insert(Clothes.make2('8', 'Jaqueta','assets/img/cold.png',EnumGender.MALE.index ));
    // await this._clothesBean.placeClothesBean.insert(PlaceClothes.make('1', '6'));
    // await this._clothesBean.placeClothesBean.insert(PlaceClothes.make('1', '7'));
    // await this._clothesBean.placeClothesBean.insert(PlaceClothes.make('1', '8'));
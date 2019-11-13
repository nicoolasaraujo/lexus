import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';
import 'package:lexus/app/model/ClassSituation.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/model/place.dart';

class PlaceRepository {
  SqfliteAdapter _adapter;
  PlaceBean _placeBean;

  PlaceRepository(this._adapter) {
    this._placeBean = PlaceBean(this._adapter);
  }

  Future<List<Place>> getPlacesByClassActivity(String classId) async {
    await this._adapter.connect();
    Find find = this._placeBean.finder;
    // find.or(this.bean.situationBean.id.eq('1'));
    var response = await this
        ._placeBean
        .situationBean
        .classSituationBean
        .findWhere(this
            ._placeBean
            .situationBean
            .classSituationBean
            .classId
            .eq(classId));

    for (ClassSituation x in response) {
      find.or(this._placeBean.situationBean.id.eq(x.situationId));
    }

    var x = await this._placeBean.situationBean.findMany(find);
    for (Situation st in x) {
      find.or(this._placeBean.id.eq(st.placeId));
    }

    return await this._placeBean.findMany(find);
  }
}

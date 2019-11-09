import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/model/ClassSituation.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/model/SituationOptions.dart';

class SituationRepository {
  SqfliteAdapter _adapter;
  SituationBean _situationBean;
  SituationRepository(this._adapter) {
    this._situationBean = SituationBean(this._adapter);
  }

  Future<List<Situation>> findSituationByActivity(String classId,
      {bool preload = false}) async {
    try {
      await this._adapter.connect();
      Find finder = this._situationBean.finder;
      finder.or(this._situationBean.classActivityBean.id.eq(classId));
      return await this._situationBean.findMany(finder);
    } catch (error) {
      throw error;
    }
  }

  Future<List<Situation>> loadSituationsByPlaceAndActivity(
      String classId, String placeId) async {
    try {
      await this._adapter.connect();
      Find find = this._situationBean.finder;
      var activities = await this._situationBean.classSituationBean.findWhere(
          this._situationBean.classSituationBean.classId.eq(classId));

      for (ClassSituation st in activities) {
        find.or(this._situationBean.id.eq(st.situationId));
      }
      find.where(this._situationBean.placeId.eq(placeId));

      var x = await this._situationBean.findMany(find);
      return await this._situationBean.preloadAll(x, cascade: true);
    } catch (error) {
      throw error;
    }
  }

  Future<SituationOptions> rightAnswerSituation(Situation situation) async {
    var option = await this._situationBean.situationOptionsBean.findWhere(this._situationBean.situationOptionsBean.situationId.eq(situation.id) & this._situationBean.situationOptionsBean.rigthAnswer.eq(true));
    return option.first;
  }
}

import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/model/Situation.dart';

class SituationRepository {
  SqfliteAdapter _adapter;
  SituationBean _situationBean;
  SituationRepository(this._adapter){
    this._situationBean = SituationBean(this._adapter);
  }

  Future<List<Situation>> findSituationByActivity(String classId) async {
    try {
      await this._adapter.connect();
      Find finder = this._situationBean.finder;
      finder.or(this._situationBean.classActivityBean.id.eq(classId));
      return await this._situationBean.findMany(finder);
    } catch (error) {
      throw error;
    }
  }
}

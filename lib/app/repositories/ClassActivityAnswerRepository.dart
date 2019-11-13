import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';

class ClassActivityAnswerRepository {
  SqfliteAdapter _adapter;
  ClassActivityAnswerBean _activityAnswerBean;

  ClassActivityAnswerRepository(this._adapter) {
    this._activityAnswerBean = ClassActivityAnswerBean(this._adapter);
  }

  Future<void> insert(ClassActivityAnswer userAnswer) async {
    await this._activityAnswerBean.insert(userAnswer, cascade: true);
    var x = await this._activityAnswerBean.find(userAnswer.id, preload: true);
  }
}

import 'dart:async';
import 'dart:core';
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
    if (!this._adapter.connection.isOpen) {
      await this._adapter.connect();
    }
    return await this._activityAnswerBean.insert(userAnswer, cascade: true);
  }

  // Future<ClassActivityAnswer> report(String classId) async {
  //   if (!this._adapter.connection.isOpen) {
  //     await this._adapter.connect();
  //   }

  //   String query = """SELECT *
  //                   FROM ClassActivityAnswer CLASSAN
  //                   INNER JOIN ${this._activityAnswerBean.situationAnswerBean.tableName} STAN
  //                     ON (CLASSAN.ID = STAN.acitivity_answer_id)
  //                   INNER JOIN ${this._activityAnswerBean.situationAnswerBean.optionBean.tableName} OPT ON (OPT.ID = STAN.option_id)
  //                                       INNER JOIN (SELECT 
  //                                 ST1.*,
  //                                 STOP.*, 
  //                                 OPT1.DESCRIPTION
  //                               FROM ${this._activityAnswerBean.situationAnswerBean.situationBean.tableName} ST1
  //                               INNER JOIN ${this._activityAnswerBean.situationAnswerBean.situationBean.situationOptionsBean.tableName} STOP
  //                               ON (ST1.ID = STOP.${this._activityAnswerBean.situationAnswerBean.situationBean.situationOptionsBean.situationId.name})
  //                               INNER JOIN ${this._activityAnswerBean.situationAnswerBean.optionBean.tableName} OPT1
  //                               ON (STOP.${this._activityAnswerBean.situationAnswerBean.situationBean.situationOptionsBean.optionsId.name} = OPT1.ID)
  //                               WHERE rigth_answer = 1
  //                               ) SITOP
  //                   ON (SITOP.ID = STAN.situationid)
  //                    WHERE CLASSAN.class_acitviy_id = $classId""";

  //   var response = await this._adapter.connection.rawQuery(query);
  //   response.asMap().forEach((key, value) => print('Key: $key  Value: $value'));
  // }
}

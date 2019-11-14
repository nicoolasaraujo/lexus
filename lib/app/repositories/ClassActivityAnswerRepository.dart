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

  Future<ClassActivityAnswer> report(String classId) async {
    if (!this._adapter.connection.isOpen) {
      await this._adapter.connect();
    }

    String query = """SELECT * 
                    FROM ClassActivityAnswer CLASSAN
                    INNER JOIN ${this._activityAnswerBean.situationAnswerBean.tableName} STAN
                      ON (CLASSAN.ID = STAN.CLASSANSWERID)
                    INNER JOIN OPTIONS OPT ON (OPT.ID = STAN.ID)
                    INNER JOIN (SELECT 
                                  ST1.*, 
                                  OPT1.DESCRIPTION
                                FROM SITUATION ST1
                                INNER JOIN SITUATIONOPTION STOP
                                ON (ST1.ID = STOP.SITUATIONID)
                                INNER JOIN OPTIONS OPT1
                                ON (STOP.OPTIONID = OPT1.ID)
                                WHERE STOP.RIGHTANSWER = 1
                                ) SITOP
                    ON (SITOP.ID = STAN.SITUATIONID) WHERE STAN.CLASSID = $classId""";

    var response = await this._adapter.connection.rawQuery(query);
    print(response);

    // return await this._activityAnswerBean.find(classId, preload: true, cascade: true);
  }
}

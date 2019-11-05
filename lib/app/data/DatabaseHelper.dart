import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/ClassSituationBean.dart';
import 'package:lexus/app/data/Beans/ClassroomBean.dart';
import 'package:lexus/app/data/Beans/ClothesBean.dart';
import 'package:lexus/app/data/Beans/OptionBean.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';
import 'package:lexus/app/data/Beans/PlaceClothesBean.dart';
import 'package:lexus/app/data/Beans/SituationAnswersBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/data/Beans/StudentBean.dart';
import 'package:lexus/app/data/Beans/TeacherBean.dart';
import 'package:lexus/app/shared/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

import 'Beans/SituationOptionsBean.dart';

class DatabaseHelper {
  static String dbPath = '';

  Future<void> createDatabase() async {
    dbPath = path.join(await getDatabasesPath(), DATABASE_NAME);
    SqfliteAdapter adapter =
        new SqfliteAdapter(dbPath, version: DATABASE_VERSION);
    await adapter.connect();
    await this.handleCreateTable(adapter);
  }

  Future<void> handleCreateTable(SqfliteAdapter adapter) async {
    List<dynamic> generatedBeans = [
      PlaceBean(adapter),
      ClothesBean(adapter),
      PlaceClothesBean(adapter),
      ClassroomBean(adapter),
      TeacherBean(adapter),
      StudentBean(adapter),
      ClassActivityBean(adapter),
      SituationBean(adapter),
      SituationOptionsBean(adapter),
      OptionBean(adapter),
      ClassSituationBean(adapter),
      ClassActivityAnswerBean(adapter),
      SituationAnswersBean(adapter)
    ];

    generatedBeans.map((item) async {
      await item.createTable(ifNotExists: true);
    });
  }
}

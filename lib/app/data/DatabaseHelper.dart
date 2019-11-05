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
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/ClassSituation.dart';
import 'package:lexus/app/model/Clothes.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/model/Option.dart';
import 'package:lexus/app/model/PlaceClothes.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/model/SituationOptions.dart';
import 'package:lexus/app/model/Student.dart';
import 'package:lexus/app/model/Teacher.dart';
import 'package:lexus/app/model/classActivity.dart';
import 'package:lexus/app/model/place.dart';
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

    await this.fillDatabase(adapter);
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

    // generatedBeans.map((item) async {
    //   await item.createTable(ifNotExists: true);
    // });
    for (var bean in generatedBeans){
      bean.createTable(ifNotExists: true);
    }
  }

  fillDatabase(SqfliteAdapter adapter) async {
    // await TeacherBean(adapter).insert(Teacher.make(
    //     '1', 'Alguma professor', DateTime.now(), 'path', 'email@email.com'));

    // await ClassroomBean(adapter).insert(Classroom.make('1', 'Sala1', '1'));

    // await StudentBean(adapter).insert(Student.makeClassRoom(
    //     '1', 'Nicolas', DateTime.now(), EnumGender.MALE.index, '1', 'xx'));

    // await  ClothesBean(adapter).insert(Clothes.make2('1', 'Alugma roupa', 'xxx', 1));

    // await PlaceBean(adapter).insert(Place.make('1', 'shopping', 'imgPath'));

    // await PlaceClothesBean(adapter).insert(PlaceClothes.make('1', '1'));

    // await ClassActivityBean(adapter).insert(ClassActivity.make('1', 'Primeira aula banco', DateTime.now(), EnumStatus.TODO.index, '1', '1'));

    // await SituationBean(adapter).insert(Situation.make('1', 'Passeando no shops', 'Selecione uma palavra', '1'));

    // await OptionBean(adapter).insert(Option.make('1', 'Opção1'));
    // await OptionBean(adapter).insert(Option.make('2', 'Opção2'));
    // await OptionBean(adapter).insert(Option.make('3', 'Opção3'));
    // await OptionBean(adapter).insert(Option.make('4', 'Opção4'));

    // await SituationOptionsBean(adapter).insert(SituationOptions.make('1', '1', true));
    // await SituationOptionsBean(adapter).insert(SituationOptions.make('1', '2', false));
    // await SituationOptionsBean(adapter).insert(SituationOptions.make('1', '3', false));
    // await SituationOptionsBean(adapter).insert(SituationOptions.make('1', '4', false));

    // await ClassSituationBean(adapter).insert(ClassSituation.make('1', '1'));
  }
}

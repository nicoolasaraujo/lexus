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
import 'package:lexus/app/model/ClassSituation.dart';
import 'package:lexus/app/model/ClassSituation.dart';
import 'package:lexus/app/model/Clothes.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/model/Option.dart';
import 'package:lexus/app/model/PlaceClothes.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/model/Situation.dart';
import 'package:lexus/app/model/SituationOptions.dart';
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
    // await this.fillPlaces(adapter);
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

    for (var bean in generatedBeans) {
      bean.createTable(ifNotExists: true);
    }
  }

  fillPlaces(SqfliteAdapter adapter) {
    PlaceBean(adapter)
        .insert(Place.make('200', 'Padaria', 'assets/img/padaria.jfif'));

    List<Clothes> clothes = [
      Clothes.make2(
          '200', 'Roupa1', 'assets/img/cold.png', EnumGender.MALE.index),
      Clothes.make2(
          '201', 'Roupa2', 'assets/img/cold.png', EnumGender.MALE.index),
      Clothes.make2(
          '202', 'Roupa3', 'assets/img/cold.png', EnumGender.MALE.index),
      Clothes.make2(
          '203', 'Roupa4', 'assets/img/cold.png', EnumGender.MALE.index),
    ];

    ClothesBean(adapter).insertMany(clothes);

    List<PlaceClothes> placeClothes = [
      PlaceClothes.make('200', '200'),
      PlaceClothes.make('200', '201'),
      PlaceClothes.make('200', '202'),
      PlaceClothes.make('200', '203'),
    ];

    PlaceClothesBean(adapter).insertMany(placeClothes);

    List<Situation> listSituation = [
      Situation.make('200', 'Situação Padaria 1', 'Selecione uma opção', '200'),
      Situation.make('201', 'Situação Padaria 2', 'Selecione uma opção', '200')
    ];

    SituationBean(adapter).insertMany(listSituation);

    List<ClassSituation> clasSituation = [
      ClassSituation.make('1', '200'),
      ClassSituation.make('1', '201'),
    ];

    ClassSituationBean(adapter).insertMany(clasSituation);


    List<Option> options = [
      Option.make('200', 'Opção 1'),
      Option.make('201', 'Opção 2'),
      Option.make('202', 'Opção 3'),
      Option.make('203', 'Opção 4'),

      Option.make('204', 'Opção 5'),
      Option.make('205', 'Opção 6'),
      Option.make('206', 'Opção 7'),
      Option.make('207', 'Opção 8')
    ];
    OptionBean(adapter).insertMany(options);
  
    List<SituationOptions> sop = [
      SituationOptions.make('200', '200', true),
      SituationOptions.make('200', '201', true),
      SituationOptions.make('200', '202', true),
      SituationOptions.make('200', '203', true),

      SituationOptions.make('201', '204', true),
      SituationOptions.make('201', '205', true),
      SituationOptions.make('201', '206', true),
      SituationOptions.make('201', '207', true),
    ];

    SituationOptionsBean(adapter).insertMany(sop);

  }
}

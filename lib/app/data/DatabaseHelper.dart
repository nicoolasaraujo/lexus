import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/data/Beans/ClassActivityAnswerBean.dart';
import 'package:lexus/app/data/Beans/ClassActivityBean.dart';
import 'package:lexus/app/data/Beans/ClassSituationBean.dart';
import 'package:lexus/app/data/Beans/ClassroomBean.dart';
import 'package:lexus/app/data/Beans/ClothesBean.dart';
import 'package:lexus/app/data/Beans/OptionBean.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart' as prefix0;
import 'package:lexus/app/data/Beans/PlaceClothesBean.dart';
import 'package:lexus/app/data/Beans/SituationAnswersBean.dart';
import 'package:lexus/app/data/Beans/SituationBean.dart';
import 'package:lexus/app/data/Beans/StudentBean.dart';
import 'package:lexus/app/data/Beans/TeacherBean.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/model/ClassSituation.dart';
import 'package:lexus/app/model/ClassSituation.dart';
import 'package:lexus/app/model/Clothes.dart';
import 'package:lexus/app/model/Enumerators.dart';
import 'package:lexus/app/model/Option.dart';
import 'package:lexus/app/model/PlaceClothes.dart';
import 'package:lexus/app/model/Situation.dart';
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
    var x = DropDb(dbPath);
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


    for (var bean in generatedBeans) {
      bean.drop();
    }

    for (var bean in generatedBeans) {
      bean.createTable(ifNotExists: true);
    }
  }

  fillDatabase(SqfliteAdapter adapter) async {
    PlaceBean(adapter).insert(Place.make('0', 'Local padrão', 'x'));

    PlaceBean(adapter)
        .insert(Place.make('1', 'Padaria', 'assets/img/padaria.jfif'));

    PlaceBean(adapter)
        .insert(Place.make('2', 'Shopping', 'assets/img/shopping.jfif'));

    List<Clothes> clothes = [
      Clothes.make2(
          '101', 'Roupa1', 'assets/img/cold.png', EnumGender.MALE.index),
      Clothes.make2(
          '102', 'Roupa2', 'assets/img/cold.png', EnumGender.MALE.index),
      Clothes.make2(
          '103', 'Roupa3', 'assets/img/cold.png', EnumGender.MALE.index),
      Clothes.make2(
          '104', 'Roupa4', 'assets/img/cold.png', EnumGender.MALE.index),
      Clothes.make2(
          '201', 'Roupa5', 'assets/img/cold.png', EnumGender.MALE.index),
      Clothes.make2(
          '202', 'Roupa6', 'assets/img/cold.png', EnumGender.MALE.index),
      Clothes.make2(
          '203', 'Roupa7', 'assets/img/cold.png', EnumGender.MALE.index),
      Clothes.make2(
          '204', 'Roupa8', 'assets/img/cold.png', EnumGender.MALE.index),
    ];
    ClothesBean(adapter).insertMany(clothes);

    List<PlaceClothes> placeClothes = [
      PlaceClothes.make('1', '101'),
      PlaceClothes.make('1', '102'),
      PlaceClothes.make('1', '103'),
      PlaceClothes.make('1', '104'),
      PlaceClothes.make('2', '201'),
      PlaceClothes.make('2', '202'),
      PlaceClothes.make('2', '203'),
      PlaceClothes.make('2', '204'),
    ];
    PlaceClothesBean(adapter).insertMany(placeClothes);

    TeacherBean(adapter).insert(Teacher.make(
        '1', 'Tony Stark', DateTime.now(), 'xxxx', 'email@email.com'));

    ClassroomBean(adapter)
        .insert(Classroom.makeTeacherId('1', 'Turma - 1', '1'));

    StudentBean(adapter).insert(Student.makeClassRoom(
        '1', 'Aluno padrão', DateTime.now(), 0, '1', 'xxxx'));

    List<Situation> listSituation = [
      Situation.make('1', 'Situação Padaria 1', 'Selecione uma opção', '1'),
      Situation.make('2', 'Situação Padaria 2', 'Selecione uma opção', '1'),
      Situation.make('3', 'Situação Padaria 3', 'Selecione uma opção', '1'),
      Situation.make('4', 'Situação Shopping 4', 'Selecione uma opção', '2'),
      Situation.make('5', 'Situação Shopping 5', 'Selecione uma opção', '2'),
      Situation.make('6', 'Situação Shopping 6', 'Selecione uma opção', '2'),
      Situation.make(
          '7', 'Sinônimos 1', 'Qual o sinônimo da palavra trabalho? ', '0',
          situationType: 1),
      Situation.make('8', 'Sinônimos 2',
          'Qual das palavras abaixo não corresponde ao sinônimo de casa?', '0',
          situationType: 1),
      Situation.make('9', 'Sinônimos 3',
          'Qual a palavra que não corresponde ao sinônimo da palavra tarefa?', '0',
          situationType: 1),
    ];

    SituationBean(adapter).insertMany(listSituation);

    ClassActivityBean(adapter).insert(ClassActivity.make('1', 'Aula demo', DateTime.now(), 0, '1', '1'));

    List<ClassSituation> clasSituation = [
      ClassSituation.make('1', '1'),
      ClassSituation.make('1', '2'),
      ClassSituation.make('1', '3'),
      ClassSituation.make('1', '4'),
      ClassSituation.make('1', '5'),
      ClassSituation.make('1', '6'),
      ClassSituation.make('1', '7'),
      ClassSituation.make('1', '8'),
      ClassSituation.make('1', '9'),
    ];

    ClassSituationBean(adapter).insertMany(clasSituation);

    List<Option> options = [
      Option.make('1', 'Opção 1'),
      Option.make('2', 'Opção 2'),
      Option.make('3', 'Opção 3'),
      Option.make('4', 'Opção 4'),
      Option.make('5', 'Opção 5'),
      Option.make('6', 'Opção 6'),
      Option.make('7', 'Opção 7'),
      Option.make('8', 'Opção 8'),

      //Situação 7
      Option.make('9', 'Emprego'), //correta
      Option.make('10', 'Empresa'),
      Option.make('11', 'Firma'),
      Option.make('12', 'Loja'),

      //Situação 8
      Option.make('13', 'Lar'),
      Option.make('14', 'Residência'),
      Option.make('15', 'Moradia'),
      Option.make('16', 'Sofá'), //correta

      //Situação 9
      Option.make('17', 'Obrigação'),
      Option.make('18', 'Dever'),
      Option.make('19', 'Estado'), //correta
      Option.make('20', 'Efício'),


    ];
    OptionBean(adapter).insertMany(options);

    List<SituationOptions> sop = [
      SituationOptions.make('1', '1', true),
      SituationOptions.make('1', '2', false),
      SituationOptions.make('1', '3', false),
      SituationOptions.make('1', '4', false),

      SituationOptions.make('2', '1', true),
      SituationOptions.make('2', '2', false),
      SituationOptions.make('2', '3', false),
      SituationOptions.make('2', '4', false),

      SituationOptions.make('3', '4', true),
      SituationOptions.make('3', '5', false),
      SituationOptions.make('3', '6', false),
      SituationOptions.make('3', '7', false),

      SituationOptions.make('4', '1', true),
      SituationOptions.make('4', '8', false),
      SituationOptions.make('4', '3', false),
      SituationOptions.make('4', '2', false),

      SituationOptions.make('5', '2', true),
      SituationOptions.make('5', '7', false),
      SituationOptions.make('5', '8', false),
      SituationOptions.make('5', '3', false),

      SituationOptions.make('6', '5', true),
      SituationOptions.make('6', '6', false),
      SituationOptions.make('6', '7', false),
      SituationOptions.make('6', '8', false),

      SituationOptions.make('7', '9', true),
      SituationOptions.make('7', '10', false),
      SituationOptions.make('7', '11', false),
      SituationOptions.make('7', '12', false),

      SituationOptions.make('8', '13', false),
      SituationOptions.make('8', '14', false),
      SituationOptions.make('8', '15', false),
      SituationOptions.make('8', '16', true),

      SituationOptions.make('9', '19', true),
      SituationOptions.make('9', '17', false),
      SituationOptions.make('9', '18', false),
      SituationOptions.make('9', '20', false),

    ];

    SituationOptionsBean(adapter).insertMany(sop);
  }
}

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
    await openDatabase(dbPath, version: DATABASE_VERSION,
        onCreate: (Database database, int version) async {
      SqfliteAdapter adapter = new SqfliteAdapter.fromConnection(database);
      this.handleCreateTable(adapter);
    });
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

    this.fillDatabase(adapter);
  }

  void fillDatabase(SqfliteAdapter adapter) async {
    PlaceBean(adapter).insert(Place.make('0', 'Local padrão', 'x'));

    PlaceBean(adapter)
        .insert(Place.make('1', 'Padaria', 'assets/img/padaria.jpg'));

    PlaceBean(adapter)
        .insert(Place.make('2', 'Shopping', 'assets/img/shopping.jfif'));

    PlaceBean(adapter).insert(Place.make('3', "Feira", "assets/img/feira.jpg"));

    PlaceBean(adapter).insert(Place.make(
        '4', "Concessionária", "assets/img/concessionariocarros.jfif"));

    List<Clothes> clothes = [
      Clothes.make2('101', 'Roupa de banho',
          'assets/img/roupas/banho/bermuda.jpg', EnumGender.MALE.index),
      Clothes.make2('102', 'Formal', 'assets/img/roupas/formal/camiseta.jpg',
          EnumGender.MALE.index),
      Clothes.make2('103', 'Despojado',
          'assets/img/roupas/despojado/despojadom.jpg', EnumGender.MALE.index),
      Clothes.make2('104', 'Terno', 'assets/img/roupas/terno/terno.jpg',
          EnumGender.MALE.index),
      Clothes.make2('201', 'Roupa de banho',
          'assets/img/roupas/banho/biquine.jpg', EnumGender.FEMALE.index),
      Clothes.make2(
          '202',
          'Formal',
          'assets/img/roupas/formal/vestidosimples.jpg',
          EnumGender.FEMALE.index),
      Clothes.make2(
          '203',
          'Despojado',
          'assets/img/roupas/despojado/despojadof.jpg',
          EnumGender.FEMALE.index),
      Clothes.make2('204', 'Vestido', 'assets/img/roupas/terno/vestido.jpg',
          EnumGender.FEMALE.index),
    ];
    ClothesBean(adapter).insertMany(clothes);

    List<PlaceClothes> placeClothes = [
      PlaceClothes.make('1', '101'),
      PlaceClothes.make('1', '102'),
      PlaceClothes.make('1', '103'),
      PlaceClothes.make('1', '104'),
      PlaceClothes.make('1', '101'),
      PlaceClothes.make('1', '102'),
      PlaceClothes.make('1', '103'),
      PlaceClothes.make('1', '104'),
      PlaceClothes.make('2', '101'),
      PlaceClothes.make('2', '102'),
      PlaceClothes.make('2', '103'),
      PlaceClothes.make('2', '104'),
      PlaceClothes.make('2', '201'),
      PlaceClothes.make('2', '202'),
      PlaceClothes.make('2', '203'),
      PlaceClothes.make('2', '204'),
      PlaceClothes.make('3', '101'),
      PlaceClothes.make('3', '102'),
      PlaceClothes.make('3', '103'),
      PlaceClothes.make('3', '104'),
      PlaceClothes.make('3', '201'),
      PlaceClothes.make('3', '202'),
      PlaceClothes.make('3', '203'),
      PlaceClothes.make('3', '204'),
      PlaceClothes.make('4', '101'),
      PlaceClothes.make('4', '102'),
      PlaceClothes.make('4', '103'),
      PlaceClothes.make('4', '104'),
      PlaceClothes.make('4', '201'),
      PlaceClothes.make('4', '202'),
      PlaceClothes.make('4', '203'),
      PlaceClothes.make('4', '204'),
    ];
    PlaceClothesBean(adapter).insertMany(placeClothes);

    TeacherBean(adapter)
        .insert(Teacher.make('1', 'Mariana', 'educador1', '12345'));

    ClassroomBean(adapter).insert(Classroom.makeTeacherId(
        '1', 'Turma - 1', '1', "Turma 1 - Atendimento tarde"));

    StudentBean(adapter).insert(Student.makeClassRoom(
        '1', 'Aluno padrão', DateTime.now(), 0, '1', 'Aluno padrão'));

    List<Situation> listSituation = [
      Situation.make('1', 'Situação Padaria 1', 'Selecione uma opção', '1'),
      Situation.make('2', 'Situação Padaria 2', 'Selecione uma opção', '1'),
      Situation.make('3', 'Situação Padaria 3', 'Selecione uma opção', '1'),
      Situation.make('4', 'Situação Padaria 4', 'Selecione uma opção', '1'),

      Situation.make('5', 'Situação Shopping 1', 'Selecione uma opção', '2'),
      // Situation.make('7', 'Situação Shopping 3', 'Selecione uma opção', '2'),
      // Situation.make('8', 'Situação Shopping 4', 'Selecione uma opção', '2'),

      Situation.make('9', 'Situação Feira 1', 'Selecione uma opção', '3'),
      Situation.make('10', 'Situação Feira 2', 'Selecione uma opção', '3'),
      // Situation.make('11', 'Situação Feira 3', 'Selecione uma opção', '3'),
      // Situation.make('12', 'Situação Feira 4', 'Selecione uma opção', '3'),

      Situation.make(
          '13', 'Situação Concessionária 1', 'Selecione uma opção', '4'),
      Situation.make(
          '14', 'Situação Concessionária 2', 'Selecione uma opção', '4'),
      // Situation.make('15', 'Situação Concessionária 3', 'Selecione uma opção', '3'),
      // Situation.make('16', 'Situação Concessionária 4', 'Selecione uma opção', '3'),

      Situation.make(
          '17', 'Sinônimos 1', 'Qual o sinônimo da palavra trabalho? ', '0',
          situationType: 1),

      Situation.make('18', 'Sinônimos 2',
          'Qual das palavras abaixo não corresponde ao sinônimo de casa?', '0',
          situationType: 1),

      Situation.make(
          '19',
          'Sinônimos 3',
          'Na frase: A profissão de professor é uma *atividade* muito importante, poderíamos colocar um sinônimo para a palavra destacada, que seria',
          '0',
          situationType: 1),

      Situation.make(
          '20',
          'Sinônimos 4',
          'Qual a palavra que não corresponde ao sinônimo da palavra tarefa?',
          '0',
          situationType: 1),

      Situation.make('21', 'Sinônimos 5',
          'Identifique abaixo o sinônimo da palavra beleza:', '0',
          situationType: 1),
    ];

    SituationBean(adapter).insertMany(listSituation);

    ClassActivityBean(adapter).insert(
        ClassActivity.make('1', 'Aula Locais', DateTime.now(), '1', '1'));

    List<ClassSituation> clasSituation = [
      ClassSituation.make('1', '1'),
      ClassSituation.make('1', '2'),
      ClassSituation.make('1', '3'),
      ClassSituation.make('1', '4'),
      ClassSituation.make('1', '5'),
      ClassSituation.make('1', '9'),
      ClassSituation.make('1', '10'),
      ClassSituation.make('1', '13'),
      ClassSituation.make('1', '14'),
      ClassSituation.make('1', '17'),
      ClassSituation.make('1', '18'),
      ClassSituation.make('1', '19'),
      ClassSituation.make('1', '20'),
      ClassSituation.make('1', '21'),
    ];

    ClassSituationBean(adapter).insertMany(clasSituation);

    List<Option> options = [
      //padaria
      Option.make('1', 'Saboroso'),
      Option.make('2', 'Doce'),
      Option.make('3', 'Salgado'),
      Option.make('4', 'Assado'),

      //shopping
      Option.make('5', 'Roupas'),
      Option.make('6', 'Preço'),
      Option.make('7', 'Compras'),
      Option.make('8', 'Lojas'),

      //Feira
      //usar 6
      Option.make('9', 'Verduras'),
      Option.make('10', 'Frutas'),
      Option.make('12', 'Tomate'),

      //Concessionária
      //usar 6
      Option.make('13', 'Carros'),
      Option.make('14', 'Quilômetro'),
      Option.make('15', 'Vender'),

      //Aleatórias
      Option.make('16', 'Estudar'),
      Option.make('17', 'Elefante'),
      Option.make('18', 'Jogos'),
      Option.make('19', 'Melancia'),
      Option.make('20', 'Cama'),
      Option.make('21', 'Martelo'),
      Option.make('22', 'Táxi'),
      Option.make('23', 'Plano'),
      Option.make('24', 'Televisão'),
      Option.make('25', 'Remédio'),
      Option.make('26', 'Correr'),
      Option.make('27', 'Computador'),
      Option.make('28', 'Avião'),
      Option.make('29', 'Faculdade'),

      //Situação 17
      Option.make('101', 'Emprego'), //correta
      Option.make('102', 'Empresa'),
      Option.make('103', 'Firma'),
      Option.make('104', 'Loja'),

      // //Situação 18
      Option.make('105', 'Lar'),
      Option.make('106', 'Residência'),
      Option.make('107', 'Moradia'),
      Option.make('108', 'Sofá'), //correta

      //Situação 19
      Option.make('109', 'Ocupação'), //ocupação
      Option.make('110', 'Parte'),
      Option.make('111', 'Dívida'),
      Option.make('112', 'Dúvida'),

      //Situação 20
      Option.make('113', 'Obrigação'),
      Option.make('114', 'Dever'),
      Option.make('115', 'Estado'), //correta
      Option.make('116', 'Ofício'),

      //Situação 21
      Option.make('117', 'Formosura'), //correta
      Option.make('118', 'Alteza'),
      Option.make('119', 'Bondade'),
      Option.make('120', 'Engraçado'),
    ];
    OptionBean(adapter).insertMany(options);

    List<SituationOptions> sop = [
      //padaria
      SituationOptions.make('1', '1', true),
      SituationOptions.make('1', '106', false),
      SituationOptions.make('1', '17', false),
      SituationOptions.make('1', '112', false),

      SituationOptions.make('2', '2', true),
      SituationOptions.make('2', '105', false),
      SituationOptions.make('2', '13', false),
      SituationOptions.make('2', '18', false),

      SituationOptions.make('3', '3', true),
      SituationOptions.make('3', '108', false),
      SituationOptions.make('3', '111', false),
      SituationOptions.make('3', '18', false),

      SituationOptions.make('4', '4', true),
      SituationOptions.make('4', '19', false),
      SituationOptions.make('4', '20', false),
      SituationOptions.make('4', '21', false),

      //shopping
      SituationOptions.make('5', '5', true),
      SituationOptions.make('5', '105', false),
      SituationOptions.make('5', '22', false),
      SituationOptions.make('5', '23', false),

      //Feira
      SituationOptions.make('9', '9', true),
      SituationOptions.make('9', '24', false),
      SituationOptions.make('9', '20', false),
      SituationOptions.make('9', '108', false),

      SituationOptions.make('10', '10', true),
      SituationOptions.make('10', '25', false),
      SituationOptions.make('10', '26', false),
      SituationOptions.make('10', '27', false),

      //Concessionária
      SituationOptions.make('13', '13', true),
      SituationOptions.make('13', '28', false),
      SituationOptions.make('13', '22', false),
      SituationOptions.make('13', '103', false),

      SituationOptions.make('14', '14', true),
      SituationOptions.make('14', '26', false),
      SituationOptions.make('14', '111', false),
      SituationOptions.make('14', '29', false),

      //Sinônimos
      SituationOptions.make('17', '101', true),
      SituationOptions.make('17', '102', false),
      SituationOptions.make('17', '103', false),
      SituationOptions.make('17', '104', false),

      SituationOptions.make('18', '105', false),
      SituationOptions.make('18', '106', false),
      SituationOptions.make('18', '107', false),
      SituationOptions.make('18', '108', true),

      SituationOptions.make('19', '109', true),
      SituationOptions.make('19', '110', false),
      SituationOptions.make('19', '111', false),
      SituationOptions.make('19', '112', false),

      SituationOptions.make('20', '113', false),
      SituationOptions.make('20', '114', false),
      SituationOptions.make('20', '115', true),
      SituationOptions.make('20', '116', false),

      SituationOptions.make('21', '117', true),
      SituationOptions.make('21', '118', false),
      SituationOptions.make('21', '119', false),
      SituationOptions.make('21', '120', false),
    ];

    SituationOptionsBean(adapter).insertMany(sop);
  }
}

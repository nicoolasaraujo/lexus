// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClassActivityAnswerBean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ClassActivityAnswerBean implements Bean<ClassActivityAnswer> {
  final id = StrField('id');
  final initialTime = DateTimeField('initial_time');
  final endTime = DateTimeField('end_time');
  final classAcitviyId = StrField('class_acitviy_id');
  final clothesId = StrField('clothes_id');
  final placeId = StrField('place_id');
  final studentId = StrField('student_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        initialTime.name: initialTime,
        endTime.name: endTime,
        classAcitviyId.name: classAcitviyId,
        clothesId.name: clothesId,
        placeId.name: placeId,
        studentId.name: studentId,
      };
  ClassActivityAnswer fromMap(Map map) {
    ClassActivityAnswer model = ClassActivityAnswer();
    model.id = adapter.parseValue(map['id']);
    model.initialTime = adapter.parseValue(map['initial_time']);
    model.endTime = adapter.parseValue(map['end_time']);
    model.classAcitviyId = adapter.parseValue(map['class_acitviy_id']);
    model.clothesId = adapter.parseValue(map['clothes_id']);
    model.placeId = adapter.parseValue(map['place_id']);
    model.studentId = adapter.parseValue(map['student_id']);

    return model;
  }

  List<SetColumn> toSetColumns(ClassActivityAnswer model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(initialTime.set(model.initialTime));
      ret.add(endTime.set(model.endTime));
      ret.add(classAcitviyId.set(model.classAcitviyId));
      ret.add(clothesId.set(model.clothesId));
      ret.add(placeId.set(model.placeId));
      ret.add(studentId.set(model.studentId));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(initialTime.name))
        ret.add(initialTime.set(model.initialTime));
      if (only.contains(endTime.name)) ret.add(endTime.set(model.endTime));
      if (only.contains(classAcitviyId.name))
        ret.add(classAcitviyId.set(model.classAcitviyId));
      if (only.contains(clothesId.name))
        ret.add(clothesId.set(model.clothesId));
      if (only.contains(placeId.name)) ret.add(placeId.set(model.placeId));
      if (only.contains(studentId.name))
        ret.add(studentId.set(model.studentId));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.initialTime != null) {
        ret.add(initialTime.set(model.initialTime));
      }
      if (model.endTime != null) {
        ret.add(endTime.set(model.endTime));
      }
      if (model.classAcitviyId != null) {
        ret.add(classAcitviyId.set(model.classAcitviyId));
      }
      if (model.clothesId != null) {
        ret.add(clothesId.set(model.clothesId));
      }
      if (model.placeId != null) {
        ret.add(placeId.set(model.placeId));
      }
      if (model.studentId != null) {
        ret.add(studentId.set(model.studentId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addDateTime(initialTime.name, isNullable: false);
    st.addDateTime(endTime.name, isNullable: false);
    st.addStr(classAcitviyId.name,
        foreignTable: classActivityBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    st.addStr(clothesId.name,
        foreignTable: clothesBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    st.addStr(placeId.name,
        foreignTable: placeBean.tableName, foreignCol: 'id', isNullable: false);
    st.addStr(studentId.name,
        foreignTable: studentBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(ClassActivityAnswer model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      ClassActivityAnswer newModel;
      if (model.situationAnswers != null) {
        newModel ??= await find(model.id);
        model.situationAnswers.forEach((x) =>
            situationAnswerBean.associateClassActivityAnswer(x, newModel));
        for (final child in model.situationAnswers) {
          await situationAnswerBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<ClassActivityAnswer> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(insert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = models
          .map((model) =>
              toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
          .toList();
      final InsertMany insert = inserters.addAll(data);
      await adapter.insertMany(insert);
      return;
    }
  }

  Future<dynamic> upsert(ClassActivityAnswer model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      ClassActivityAnswer newModel;
      if (model.situationAnswers != null) {
        newModel ??= await find(model.id);
        model.situationAnswers.forEach((x) =>
            situationAnswerBean.associateClassActivityAnswer(x, newModel));
        for (final child in model.situationAnswers) {
          await situationAnswerBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<ClassActivityAnswer> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(upsert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = [];
      for (var i = 0; i < models.length; ++i) {
        var model = models[i];
        data.add(
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      }
      final UpsertMany upsert = upserters.addAll(data);
      await adapter.upsertMany(upsert);
      return;
    }
  }

  Future<int> update(ClassActivityAnswer model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      ClassActivityAnswer newModel;
      if (model.situationAnswers != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.situationAnswers.forEach((x) =>
              situationAnswerBean.associateClassActivityAnswer(x, newModel));
        }
        for (final child in model.situationAnswers) {
          await situationAnswerBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<ClassActivityAnswer> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(update(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = [];
      final List<Expression> where = [];
      for (var i = 0; i < models.length; ++i) {
        var model = models[i];
        data.add(
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
        where.add(this.id.eq(model.id));
      }
      final UpdateMany update = updaters.addAll(data, where);
      await adapter.updateMany(update);
      return;
    }
  }

  Future<ClassActivityAnswer> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final ClassActivityAnswer model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(String id, {bool cascade = false}) async {
    if (cascade) {
      final ClassActivityAnswer newModel = await find(id);
      if (newModel != null) {
        await situationAnswerBean.removeByClassActivityAnswer(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<ClassActivityAnswer> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<List<ClassActivityAnswer>> findByClassActivity(String classAcitviyId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.classAcitviyId.eq(classAcitviyId));
    final List<ClassActivityAnswer> models = await findMany(find);
    if (preload) {
      await this.preloadAll(models, cascade: cascade);
    }
    return models;
  }

  Future<List<ClassActivityAnswer>> findByClassActivityList(
      List<ClassActivity> models,
      {bool preload = false,
      bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (ClassActivity model in models) {
      find.or(this.classAcitviyId.eq(model.id));
    }
    final List<ClassActivityAnswer> retModels = await findMany(find);
    if (preload) {
      await this.preloadAll(retModels, cascade: cascade);
    }
    return retModels;
  }

  Future<int> removeByClassActivity(String classAcitviyId) async {
    final Remove rm = remover.where(this.classAcitviyId.eq(classAcitviyId));
    return await adapter.remove(rm);
  }

  void associateClassActivity(ClassActivityAnswer child, ClassActivity parent) {
    child.classAcitviyId = parent.id;
  }

  Future<List<ClassActivityAnswer>> findByClothes(String clothesId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.clothesId.eq(clothesId));
    final List<ClassActivityAnswer> models = await findMany(find);
    if (preload) {
      await this.preloadAll(models, cascade: cascade);
    }
    return models;
  }

  Future<List<ClassActivityAnswer>> findByClothesList(List<Clothes> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Clothes model in models) {
      find.or(this.clothesId.eq(model.id));
    }
    final List<ClassActivityAnswer> retModels = await findMany(find);
    if (preload) {
      await this.preloadAll(retModels, cascade: cascade);
    }
    return retModels;
  }

  Future<int> removeByClothes(String clothesId) async {
    final Remove rm = remover.where(this.clothesId.eq(clothesId));
    return await adapter.remove(rm);
  }

  void associateClothes(ClassActivityAnswer child, Clothes parent) {
    child.clothesId = parent.id;
  }

  Future<List<ClassActivityAnswer>> findByPlace(String placeId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.placeId.eq(placeId));
    final List<ClassActivityAnswer> models = await findMany(find);
    if (preload) {
      await this.preloadAll(models, cascade: cascade);
    }
    return models;
  }

  Future<List<ClassActivityAnswer>> findByPlaceList(List<Place> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Place model in models) {
      find.or(this.placeId.eq(model.id));
    }
    final List<ClassActivityAnswer> retModels = await findMany(find);
    if (preload) {
      await this.preloadAll(retModels, cascade: cascade);
    }
    return retModels;
  }

  Future<int> removeByPlace(String placeId) async {
    final Remove rm = remover.where(this.placeId.eq(placeId));
    return await adapter.remove(rm);
  }

  void associatePlace(ClassActivityAnswer child, Place parent) {
    child.placeId = parent.id;
  }

  Future<List<ClassActivityAnswer>> findByStudent(String studentId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.studentId.eq(studentId));
    final List<ClassActivityAnswer> models = await findMany(find);
    if (preload) {
      await this.preloadAll(models, cascade: cascade);
    }
    return models;
  }

  Future<List<ClassActivityAnswer>> findByStudentList(List<Student> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Student model in models) {
      find.or(this.studentId.eq(model.id));
    }
    final List<ClassActivityAnswer> retModels = await findMany(find);
    if (preload) {
      await this.preloadAll(retModels, cascade: cascade);
    }
    return retModels;
  }

  Future<int> removeByStudent(String studentId) async {
    final Remove rm = remover.where(this.studentId.eq(studentId));
    return await adapter.remove(rm);
  }

  void associateStudent(ClassActivityAnswer child, Student parent) {
    child.studentId = parent.id;
  }

  Future<ClassActivityAnswer> preload(ClassActivityAnswer model,
      {bool cascade = false}) async {
    model.situationAnswers =
        await situationAnswerBean.findByClassActivityAnswer(model.id,
            preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<ClassActivityAnswer>> preloadAll(List<ClassActivityAnswer> models,
      {bool cascade = false}) async {
    models
        .forEach((ClassActivityAnswer model) => model.situationAnswers ??= []);
    await OneToXHelper.preloadAll<ClassActivityAnswer, SituationAnswer>(
        models,
        (ClassActivityAnswer model) => [model.id],
        situationAnswerBean.findByClassActivityAnswerList,
        (SituationAnswer model) => [model.acitivityAnswerId],
        (ClassActivityAnswer model, SituationAnswer child) => model
            .situationAnswers = List.from(model.situationAnswers)..add(child),
        cascade: cascade);
    return models;
  }

  SituationAnswersBean get situationAnswerBean;
  ClassActivityBean get classActivityBean;
  ClothesBean get clothesBean;
  PlaceBean get placeBean;
  StudentBean get studentBean;
}

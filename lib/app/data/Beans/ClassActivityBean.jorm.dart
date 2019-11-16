// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClassActivityBean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ClassActivityBean implements Bean<ClassActivity> {
  final id = StrField('id');
  final description = StrField('description');
  final activityDay = DateTimeField('activity_day');
  final teacherId = StrField('teacher_id');
  final classroomId = StrField('classroom_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        description.name: description,
        activityDay.name: activityDay,
        teacherId.name: teacherId,
        classroomId.name: classroomId,
      };
  ClassActivity fromMap(Map map) {
    ClassActivity model = ClassActivity();
    model.id = adapter.parseValue(map['id']);
    model.description = adapter.parseValue(map['description']);
    model.activityDay = adapter.parseValue(map['activity_day']);
    model.teacherId = adapter.parseValue(map['teacher_id']);
    model.classroomId = adapter.parseValue(map['classroom_id']);

    return model;
  }

  List<SetColumn> toSetColumns(ClassActivity model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(description.set(model.description));
      ret.add(activityDay.set(model.activityDay));
      ret.add(teacherId.set(model.teacherId));
      ret.add(classroomId.set(model.classroomId));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(description.name))
        ret.add(description.set(model.description));
      if (only.contains(activityDay.name))
        ret.add(activityDay.set(model.activityDay));
      if (only.contains(teacherId.name))
        ret.add(teacherId.set(model.teacherId));
      if (only.contains(classroomId.name))
        ret.add(classroomId.set(model.classroomId));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.description != null) {
        ret.add(description.set(model.description));
      }
      if (model.activityDay != null) {
        ret.add(activityDay.set(model.activityDay));
      }
      if (model.teacherId != null) {
        ret.add(teacherId.set(model.teacherId));
      }
      if (model.classroomId != null) {
        ret.add(classroomId.set(model.classroomId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addStr(description.name, isNullable: false);
    st.addDateTime(activityDay.name, isNullable: false);
    st.addStr(teacherId.name,
        foreignTable: teacherBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    st.addStr(classroomId.name,
        foreignTable: classroomBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(ClassActivity model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      ClassActivity newModel;
      if (model.situations != null) {
        newModel ??= await find(model.id);
        for (final child in model.situations) {
          await situationBean.insert(child, cascade: cascade);
          await classSituationBean.attach(child, newModel);
        }
      }
      if (model.answer != null) {
        newModel ??= await find(model.id);
        model.answer.forEach(
            (x) => classActivityAnswerBean.associateClassActivity(x, newModel));
        for (final child in model.answer) {
          await classActivityAnswerBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<ClassActivity> models,
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

  Future<dynamic> upsert(ClassActivity model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      ClassActivity newModel;
      if (model.situations != null) {
        newModel ??= await find(model.id);
        for (final child in model.situations) {
          await situationBean.upsert(child, cascade: cascade);
          await classSituationBean.attach(child, newModel, upsert: true);
        }
      }
      if (model.answer != null) {
        newModel ??= await find(model.id);
        model.answer.forEach(
            (x) => classActivityAnswerBean.associateClassActivity(x, newModel));
        for (final child in model.answer) {
          await classActivityAnswerBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<ClassActivity> models,
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

  Future<int> update(ClassActivity model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      ClassActivity newModel;
      if (model.situations != null) {
        for (final child in model.situations) {
          await situationBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
      if (model.answer != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.answer.forEach((x) =>
              classActivityAnswerBean.associateClassActivity(x, newModel));
        }
        for (final child in model.answer) {
          await classActivityAnswerBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<ClassActivity> models,
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

  Future<ClassActivity> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final ClassActivity model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(String id, {bool cascade = false}) async {
    if (cascade) {
      final ClassActivity newModel = await find(id);
      if (newModel != null) {
        await classSituationBean.detachClassActivity(newModel);
        await classActivityAnswerBean.removeByClassActivity(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<ClassActivity> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<List<ClassActivity>> findByTeacher(String teacherId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.teacherId.eq(teacherId));
    final List<ClassActivity> models = await findMany(find);
    if (preload) {
      await this.preloadAll(models, cascade: cascade);
    }
    return models;
  }

  Future<List<ClassActivity>> findByTeacherList(List<Teacher> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Teacher model in models) {
      find.or(this.teacherId.eq(model.id));
    }
    final List<ClassActivity> retModels = await findMany(find);
    if (preload) {
      await this.preloadAll(retModels, cascade: cascade);
    }
    return retModels;
  }

  Future<int> removeByTeacher(String teacherId) async {
    final Remove rm = remover.where(this.teacherId.eq(teacherId));
    return await adapter.remove(rm);
  }

  void associateTeacher(ClassActivity child, Teacher parent) {
    child.teacherId = parent.id;
  }

  Future<List<ClassActivity>> findByClassroom(String classroomId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.classroomId.eq(classroomId));
    final List<ClassActivity> models = await findMany(find);
    if (preload) {
      await this.preloadAll(models, cascade: cascade);
    }
    return models;
  }

  Future<List<ClassActivity>> findByClassroomList(List<Classroom> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Classroom model in models) {
      find.or(this.classroomId.eq(model.id));
    }
    final List<ClassActivity> retModels = await findMany(find);
    if (preload) {
      await this.preloadAll(retModels, cascade: cascade);
    }
    return retModels;
  }

  Future<int> removeByClassroom(String classroomId) async {
    final Remove rm = remover.where(this.classroomId.eq(classroomId));
    return await adapter.remove(rm);
  }

  void associateClassroom(ClassActivity child, Classroom parent) {
    child.classroomId = parent.id;
  }

  Future<ClassActivity> preload(ClassActivity model,
      {bool cascade = false}) async {
    model.situations = await classSituationBean.fetchByClassActivity(model);
    model.answer = await classActivityAnswerBean.findByClassActivity(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<ClassActivity>> preloadAll(List<ClassActivity> models,
      {bool cascade = false}) async {
    for (ClassActivity model in models) {
      var temp = await classSituationBean.fetchByClassActivity(model);
      if (model.situations == null)
        model.situations = temp;
      else {
        model.situations.clear();
        model.situations.addAll(temp);
      }
    }
    models.forEach((ClassActivity model) => model.answer ??= []);
    await OneToXHelper.preloadAll<ClassActivity, ClassActivityAnswer>(
        models,
        (ClassActivity model) => [model.id],
        classActivityAnswerBean.findByClassActivityList,
        (ClassActivityAnswer model) => [model.classAcitviyId],
        (ClassActivity model, ClassActivityAnswer child) =>
            model.answer = List.from(model.answer)..add(child),
        cascade: cascade);
    return models;
  }

  ClassSituationBean get classSituationBean;

  SituationBean get situationBean;
  ClassActivityAnswerBean get classActivityAnswerBean;
  TeacherBean get teacherBean;
  ClassroomBean get classroomBean;
}

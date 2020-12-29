// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TeacherBean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _TeacherBean implements Bean<Teacher> {
  final id = StrField('id');
  final description = StrField('description');
  final username = StrField('username');
  final password = StrField('password');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        description.name: description,
        username.name: username,
        password.name: password,
      };
  Teacher fromMap(Map map) {
    Teacher model = Teacher();
    model.id = adapter.parseValue(map['id']);
    model.description = adapter.parseValue(map['description']);
    model.username = adapter.parseValue(map['username']);
    model.password = adapter.parseValue(map['password']);

    return model;
  }

  List<SetColumn> toSetColumns(Teacher model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(description.set(model.description));
      ret.add(username.set(model.username));
      ret.add(password.set(model.password));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(description.name))
        ret.add(description.set(model.description));
      if (only.contains(username.name)) ret.add(username.set(model.username));
      if (only.contains(password.name)) ret.add(password.set(model.password));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.description != null) {
        ret.add(description.set(model.description));
      }
      if (model.username != null) {
        ret.add(username.set(model.username));
      }
      if (model.password != null) {
        ret.add(password.set(model.password));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addStr(description.name, isNullable: false);
    st.addStr(username.name, isNullable: false);
    st.addStr(password.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Teacher model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      Teacher newModel;
      if (model.classes != null) {
        newModel ??= await find(model.id);
        model.classes
            .forEach((x) => classroomBean.associateTeacher(x, newModel));
        for (final child in model.classes) {
          await classroomBean.insert(child, cascade: cascade);
        }
      }
      if (model.classActivities != null) {
        newModel ??= await find(model.id);
        model.classActivities
            .forEach((x) => classActivityBean.associateTeacher(x, newModel));
        for (final child in model.classActivities) {
          await classActivityBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Teacher> models,
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

  Future<dynamic> upsert(Teacher model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      isForeignKeyEnabled = false}) async {
    var retId;
    if (isForeignKeyEnabled) {
      final Insert insert = Insert(tableName, ignoreIfExist: true)
          .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
      retId = await adapter.insert(insert);
      if (retId == null) {
        final Update update = updater
            .where(this.id.eq(model.id))
            .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
        retId = adapter.update(update);
      }
    } else {
      final Upsert upsert = upserter
          .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
      retId = await adapter.upsert(upsert);
    }
    if (cascade) {
      Teacher newModel;
      if (model.classes != null) {
        newModel ??= await find(model.id);
        model.classes
            .forEach((x) => classroomBean.associateTeacher(x, newModel));
        for (final child in model.classes) {
          await classroomBean.upsert(child, cascade: cascade);
        }
      }
      if (model.classActivities != null) {
        newModel ??= await find(model.id);
        model.classActivities
            .forEach((x) => classActivityBean.associateTeacher(x, newModel));
        for (final child in model.classActivities) {
          await classActivityBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Teacher> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only,
      isForeignKeyEnabled = false}) async {
    if (cascade || isForeignKeyEnabled) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(upsert(model,
            cascade: cascade, isForeignKeyEnabled: isForeignKeyEnabled));
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

  Future<int> update(Teacher model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Teacher newModel;
      if (model.classes != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.classes
              .forEach((x) => classroomBean.associateTeacher(x, newModel));
        }
        for (final child in model.classes) {
          await classroomBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
      if (model.classActivities != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.classActivities
              .forEach((x) => classActivityBean.associateTeacher(x, newModel));
        }
        for (final child in model.classActivities) {
          await classActivityBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Teacher> models,
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

  Future<Teacher> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Teacher model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(String id, {bool cascade = false}) async {
    if (cascade) {
      final Teacher newModel = await find(id);
      if (newModel != null) {
        await classroomBean.removeByTeacher(newModel.id);
        await classActivityBean.removeByTeacher(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Teacher> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<Teacher> preload(Teacher model, {bool cascade = false}) async {
    model.classes = await classroomBean.findByTeacher(model.id,
        preload: cascade, cascade: cascade);
    model.classActivities = await classActivityBean.findByTeacher(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<Teacher>> preloadAll(List<Teacher> models,
      {bool cascade = false}) async {
    models.forEach((Teacher model) => model.classes ??= []);
    await OneToXHelper.preloadAll<Teacher, Classroom>(
        models,
        (Teacher model) => [model.id],
        classroomBean.findByTeacherList,
        (Classroom model) => [model.teacherId],
        (Teacher model, Classroom child) =>
            model.classes = List.from(model.classes)..add(child),
        cascade: cascade);
    models.forEach((Teacher model) => model.classActivities ??= []);
    await OneToXHelper.preloadAll<Teacher, ClassActivity>(
        models,
        (Teacher model) => [model.id],
        classActivityBean.findByTeacherList,
        (ClassActivity model) => [model.teacherId],
        (Teacher model, ClassActivity child) => model.classActivities =
            List.from(model.classActivities)..add(child),
        cascade: cascade);
    return models;
  }

  ClassroomBean get classroomBean;
  ClassActivityBean get classActivityBean;
}

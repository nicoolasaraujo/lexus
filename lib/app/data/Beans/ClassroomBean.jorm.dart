// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClassroomBean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ClassroomBean implements Bean<Classroom> {
  final id = StrField('id');
  final description = StrField('description');
  final teacherId = StrField('teacher_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        description.name: description,
        teacherId.name: teacherId,
      };
  Classroom fromMap(Map map) {
    Classroom model = Classroom();
    model.id = adapter.parseValue(map['id']);
    model.description = adapter.parseValue(map['description']);
    model.teacherId = adapter.parseValue(map['teacher_id']);

    return model;
  }

  List<SetColumn> toSetColumns(Classroom model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(description.set(model.description));
      ret.add(teacherId.set(model.teacherId));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(description.name))
        ret.add(description.set(model.description));
      if (only.contains(teacherId.name))
        ret.add(teacherId.set(model.teacherId));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.description != null) {
        ret.add(description.set(model.description));
      }
      if (model.teacherId != null) {
        ret.add(teacherId.set(model.teacherId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addStr(description.name, isNullable: false);
    st.addStr(teacherId.name,
        foreignTable: teacherBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Classroom model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      Classroom newModel;
      if (model.students != null) {
        newModel ??= await find(model.id);
        model.students
            .forEach((x) => studentBean.associateClassroom(x, newModel));
        for (final child in model.students) {
          await studentBean.insert(child, cascade: cascade);
        }
      }
      if (model.classActivities != null) {
        newModel ??= await find(model.id);
        model.classActivities
            .forEach((x) => classActivityBean.associateClassroom(x, newModel));
        for (final child in model.classActivities) {
          await classActivityBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Classroom> models,
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

  Future<dynamic> upsert(Classroom model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Classroom newModel;
      if (model.students != null) {
        newModel ??= await find(model.id);
        model.students
            .forEach((x) => studentBean.associateClassroom(x, newModel));
        for (final child in model.students) {
          await studentBean.upsert(child, cascade: cascade);
        }
      }
      if (model.classActivities != null) {
        newModel ??= await find(model.id);
        model.classActivities
            .forEach((x) => classActivityBean.associateClassroom(x, newModel));
        for (final child in model.classActivities) {
          await classActivityBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Classroom> models,
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

  Future<int> update(Classroom model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Classroom newModel;
      if (model.students != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.students
              .forEach((x) => studentBean.associateClassroom(x, newModel));
        }
        for (final child in model.students) {
          await studentBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
      if (model.classActivities != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.classActivities.forEach(
              (x) => classActivityBean.associateClassroom(x, newModel));
        }
        for (final child in model.classActivities) {
          await classActivityBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Classroom> models,
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

  Future<Classroom> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Classroom model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(String id, {bool cascade = false}) async {
    if (cascade) {
      final Classroom newModel = await find(id);
      if (newModel != null) {
        await studentBean.removeByClassroom(newModel.id);
        await classActivityBean.removeByClassroom(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Classroom> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<List<Classroom>> findByTeacher(String teacherId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.teacherId.eq(teacherId));
    final List<Classroom> models = await findMany(find);
    if (preload) {
      await this.preloadAll(models, cascade: cascade);
    }
    return models;
  }

  Future<List<Classroom>> findByTeacherList(List<Teacher> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Teacher model in models) {
      find.or(this.teacherId.eq(model.id));
    }
    final List<Classroom> retModels = await findMany(find);
    if (preload) {
      await this.preloadAll(retModels, cascade: cascade);
    }
    return retModels;
  }

  Future<int> removeByTeacher(String teacherId) async {
    final Remove rm = remover.where(this.teacherId.eq(teacherId));
    return await adapter.remove(rm);
  }

  void associateTeacher(Classroom child, Teacher parent) {
    child.teacherId = parent.id;
  }

  Future<Classroom> preload(Classroom model, {bool cascade = false}) async {
    model.students = await studentBean.findByClassroom(model.id,
        preload: cascade, cascade: cascade);
    model.classActivities = await classActivityBean.findByClassroom(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<Classroom>> preloadAll(List<Classroom> models,
      {bool cascade = false}) async {
    models.forEach((Classroom model) => model.students ??= []);
    await OneToXHelper.preloadAll<Classroom, Student>(
        models,
        (Classroom model) => [model.id],
        studentBean.findByClassroomList,
        (Student model) => [model.classRoomId],
        (Classroom model, Student child) =>
            model.students = List.from(model.students)..add(child),
        cascade: cascade);
    models.forEach((Classroom model) => model.classActivities ??= []);
    await OneToXHelper.preloadAll<Classroom, ClassActivity>(
        models,
        (Classroom model) => [model.id],
        classActivityBean.findByClassroomList,
        (ClassActivity model) => [model.classroomId],
        (Classroom model, ClassActivity child) => model.classActivities =
            List.from(model.classActivities)..add(child),
        cascade: cascade);
    return models;
  }

  StudentBean get studentBean;
  ClassActivityBean get classActivityBean;
  TeacherBean get teacherBean;
}

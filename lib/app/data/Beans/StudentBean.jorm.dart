// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StudentBean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _StudentBean implements Bean<Student> {
  final id = StrField('id');
  final name = StrField('name');
  final birthday = DateTimeField('birthday');
  final profilePicture = StrField('profile_picture');
  final gender = IntField('gender');
  final classRoomId = StrField('class_room_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        name.name: name,
        birthday.name: birthday,
        profilePicture.name: profilePicture,
        gender.name: gender,
        classRoomId.name: classRoomId,
      };
  Student fromMap(Map map) {
    Student model = Student();
    model.id = adapter.parseValue(map['id']);
    model.name = adapter.parseValue(map['name']);
    model.birthday = adapter.parseValue(map['birthday']);
    model.profilePicture = adapter.parseValue(map['profile_picture']);
    model.gender = adapter.parseValue(map['gender']);
    model.classRoomId = adapter.parseValue(map['class_room_id']);

    return model;
  }

  List<SetColumn> toSetColumns(Student model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(name.set(model.name));
      ret.add(birthday.set(model.birthday));
      ret.add(profilePicture.set(model.profilePicture));
      ret.add(gender.set(model.gender));
      ret.add(classRoomId.set(model.classRoomId));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (only.contains(birthday.name)) ret.add(birthday.set(model.birthday));
      if (only.contains(profilePicture.name))
        ret.add(profilePicture.set(model.profilePicture));
      if (only.contains(gender.name)) ret.add(gender.set(model.gender));
      if (only.contains(classRoomId.name))
        ret.add(classRoomId.set(model.classRoomId));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
      if (model.birthday != null) {
        ret.add(birthday.set(model.birthday));
      }
      if (model.profilePicture != null) {
        ret.add(profilePicture.set(model.profilePicture));
      }
      if (model.gender != null) {
        ret.add(gender.set(model.gender));
      }
      if (model.classRoomId != null) {
        ret.add(classRoomId.set(model.classRoomId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addStr(name.name, isNullable: false);
    st.addDateTime(birthday.name, isNullable: false);
    st.addStr(profilePicture.name, isNullable: false);
    st.addInt(gender.name, isNullable: false);
    st.addStr(classRoomId.name,
        foreignTable: classroomBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Student model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      Student newModel;
      if (model.classAnswers != null) {
        newModel ??= await find(model.id);
        model.classAnswers.forEach(
            (x) => classActivityAnswerBean.associateStudent(x, newModel));
        for (final child in model.classAnswers) {
          await classActivityAnswerBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Student> models,
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

  Future<dynamic> upsert(Student model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Student newModel;
      if (model.classAnswers != null) {
        newModel ??= await find(model.id);
        model.classAnswers.forEach(
            (x) => classActivityAnswerBean.associateStudent(x, newModel));
        for (final child in model.classAnswers) {
          await classActivityAnswerBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Student> models,
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

  Future<int> update(Student model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Student newModel;
      if (model.classAnswers != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.classAnswers.forEach(
              (x) => classActivityAnswerBean.associateStudent(x, newModel));
        }
        for (final child in model.classAnswers) {
          await classActivityAnswerBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Student> models,
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

  Future<Student> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Student model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(String id, {bool cascade = false}) async {
    if (cascade) {
      final Student newModel = await find(id);
      if (newModel != null) {
        await classActivityAnswerBean.removeByStudent(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Student> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<List<Student>> findByClassroom(String classRoomId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.classRoomId.eq(classRoomId));
    final List<Student> models = await findMany(find);
    if (preload) {
      await this.preloadAll(models, cascade: cascade);
    }
    return models;
  }

  Future<List<Student>> findByClassroomList(List<Classroom> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Classroom model in models) {
      find.or(this.classRoomId.eq(model.id));
    }
    final List<Student> retModels = await findMany(find);
    if (preload) {
      await this.preloadAll(retModels, cascade: cascade);
    }
    return retModels;
  }

  Future<int> removeByClassroom(String classRoomId) async {
    final Remove rm = remover.where(this.classRoomId.eq(classRoomId));
    return await adapter.remove(rm);
  }

  void associateClassroom(Student child, Classroom parent) {
    child.classRoomId = parent.id;
  }

  Future<Student> preload(Student model, {bool cascade = false}) async {
    model.classAnswers = await classActivityAnswerBean.findByStudent(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<Student>> preloadAll(List<Student> models,
      {bool cascade = false}) async {
    models.forEach((Student model) => model.classAnswers ??= []);
    await OneToXHelper.preloadAll<Student, ClassActivityAnswer>(
        models,
        (Student model) => [model.id],
        classActivityAnswerBean.findByStudentList,
        (ClassActivityAnswer model) => [model.studentId],
        (Student model, ClassActivityAnswer child) =>
            model.classAnswers = List.from(model.classAnswers)..add(child),
        cascade: cascade);
    return models;
  }

  ClassActivityAnswerBean get classActivityAnswerBean;
  ClassroomBean get classroomBean;
}

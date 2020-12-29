// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClassSituationBean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ClassSituationBean implements Bean<ClassSituation> {
  final classId = StrField('class_id');
  final situationId = StrField('situation_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        classId.name: classId,
        situationId.name: situationId,
      };
  ClassSituation fromMap(Map map) {
    ClassSituation model = ClassSituation();
    model.classId = adapter.parseValue(map['class_id']);
    model.situationId = adapter.parseValue(map['situation_id']);

    return model;
  }

  List<SetColumn> toSetColumns(ClassSituation model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(classId.set(model.classId));
      ret.add(situationId.set(model.situationId));
    } else if (only != null) {
      if (only.contains(classId.name)) ret.add(classId.set(model.classId));
      if (only.contains(situationId.name))
        ret.add(situationId.set(model.situationId));
    } else /* if (onlyNonNull) */ {
      if (model.classId != null) {
        ret.add(classId.set(model.classId));
      }
      if (model.situationId != null) {
        ret.add(situationId.set(model.situationId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(classId.name,
        foreignTable: classActivityBean.tableName,
        foreignCol: classActivityBean.id.name,
        isNullable: false);
    st.addStr(situationId.name,
        foreignTable: situationBean.tableName,
        foreignCol: situationBean.id.name,
        isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(ClassSituation model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<ClassSituation> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(ClassSituation model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      isForeignKeyEnabled = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<ClassSituation> models,
      {bool onlyNonNull = false,
      Set<String> only,
      isForeignKeyEnabled = false}) async {
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

  Future<void> updateMany(List<ClassSituation> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(null);
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<List<ClassSituation>> findByClassActivity(String classId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.classId.eq(classId));
    return findMany(find);
  }

  Future<List<ClassSituation>> findByClassActivityList(
      List<ClassActivity> models,
      {bool preload = false,
      bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (ClassActivity model in models) {
      find.or(this.classId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByClassActivity(String classId) async {
    final Remove rm = remover.where(this.classId.eq(classId));
    return await adapter.remove(rm);
  }

  void associateClassActivity(ClassSituation child, ClassActivity parent) {
    child.classId = parent.id;
  }

  Future<int> detachClassActivity(ClassActivity model) async {
    final dels = await findByClassActivity(model.id);
    if (dels.isNotEmpty) {
      await removeByClassActivity(model.id);
      final exp = Or();
      for (final t in dels) {
        exp.or(situationBean.id.eq(t.situationId));
      }
      return await situationBean.removeWhere(exp);
    }
    return 0;
  }

  Future<List<Situation>> fetchByClassActivity(ClassActivity model) async {
    final pivots = await findByClassActivity(model.id);
// Return if model has no pivots. If this is not done, all records will be removed!
    if (pivots.isEmpty) return [];
    final exp = Or();
    for (final t in pivots) {
      exp.or(situationBean.id.eq(t.situationId));
    }
    return await situationBean.findWhere(exp);
  }

  Future<List<ClassSituation>> findBySituation(String situationId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.situationId.eq(situationId));
    return findMany(find);
  }

  Future<List<ClassSituation>> findBySituationList(List<Situation> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Situation model in models) {
      find.or(this.situationId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeBySituation(String situationId) async {
    final Remove rm = remover.where(this.situationId.eq(situationId));
    return await adapter.remove(rm);
  }

  void associateSituation(ClassSituation child, Situation parent) {
    child.situationId = parent.id;
  }

  Future<int> detachSituation(Situation model) async {
    final dels = await findBySituation(model.id);
    if (dels.isNotEmpty) {
      await removeBySituation(model.id);
      final exp = Or();
      for (final t in dels) {
        exp.or(classActivityBean.id.eq(t.classId));
      }
      return await classActivityBean.removeWhere(exp);
    }
    return 0;
  }

  Future<List<ClassActivity>> fetchBySituation(Situation model) async {
    final pivots = await findBySituation(model.id);
// Return if model has no pivots. If this is not done, all records will be removed!
    if (pivots.isEmpty) return [];
    final exp = Or();
    for (final t in pivots) {
      exp.or(classActivityBean.id.eq(t.classId));
    }
    return await classActivityBean.findWhere(exp);
  }

  Future<dynamic> attach(Situation one, ClassActivity two,
      {bool upsert = false}) async {
    final ret = ClassSituation();
    ret.situationId = one.id;
    ret.classId = two.id;
    if (!upsert) {
      return insert(ret);
    } else {
      return this.upsert(ret);
    }
  }

  ClassActivityBean get classActivityBean;
  SituationBean get situationBean;
}

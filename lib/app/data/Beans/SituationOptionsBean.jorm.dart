// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SituationOptionsBean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _SituationOptionsBean implements Bean<SituationOptions> {
  final situationId = StrField('situation_id');
  final optionsId = StrField('options_id');
  final rigthAnswer = BoolField('rigth_answer');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        situationId.name: situationId,
        optionsId.name: optionsId,
        rigthAnswer.name: rigthAnswer,
      };
  SituationOptions fromMap(Map map) {
    SituationOptions model = SituationOptions();
    model.situationId = adapter.parseValue(map['situation_id']);
    model.optionsId = adapter.parseValue(map['options_id']);
    model.rigthAnswer = adapter.parseValue(map['rigth_answer']);

    return model;
  }

  List<SetColumn> toSetColumns(SituationOptions model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(situationId.set(model.situationId));
      ret.add(optionsId.set(model.optionsId));
      ret.add(rigthAnswer.set(model.rigthAnswer));
    } else if (only != null) {
      if (only.contains(situationId.name))
        ret.add(situationId.set(model.situationId));
      if (only.contains(optionsId.name))
        ret.add(optionsId.set(model.optionsId));
      if (only.contains(rigthAnswer.name))
        ret.add(rigthAnswer.set(model.rigthAnswer));
    } else /* if (onlyNonNull) */ {
      if (model.situationId != null) {
        ret.add(situationId.set(model.situationId));
      }
      if (model.optionsId != null) {
        ret.add(optionsId.set(model.optionsId));
      }
      if (model.rigthAnswer != null) {
        ret.add(rigthAnswer.set(model.rigthAnswer));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(situationId.name,
        foreignTable: situationBean.tableName,
        foreignCol: situationBean.id.name,
        isNullable: false);
    st.addStr(optionsId.name,
        foreignTable: optionBean.tableName,
        foreignCol: optionBean.id.name,
        isNullable: false);
    st.addBool(rigthAnswer.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(SituationOptions model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<SituationOptions> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(SituationOptions model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      isForeignKeyEnabled = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<SituationOptions> models,
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

  Future<void> updateMany(List<SituationOptions> models,
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

  Future<List<SituationOptions>> findBySituation(String situationId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.situationId.eq(situationId));
    return findMany(find);
  }

  Future<List<SituationOptions>> findBySituationList(List<Situation> models,
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

  void associateSituation(SituationOptions child, Situation parent) {
    child.situationId = parent.id;
  }

  Future<int> detachSituation(Situation model) async {
    final dels = await findBySituation(model.id);
    if (dels.isNotEmpty) {
      await removeBySituation(model.id);
      final exp = Or();
      for (final t in dels) {
        exp.or(optionBean.id.eq(t.optionsId));
      }
      return await optionBean.removeWhere(exp);
    }
    return 0;
  }

  Future<List<Option>> fetchBySituation(Situation model) async {
    final pivots = await findBySituation(model.id);
// Return if model has no pivots. If this is not done, all records will be removed!
    if (pivots.isEmpty) return [];
    final exp = Or();
    for (final t in pivots) {
      exp.or(optionBean.id.eq(t.optionsId));
    }
    return await optionBean.findWhere(exp);
  }

  Future<List<SituationOptions>> findByOption(String optionsId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.optionsId.eq(optionsId));
    return findMany(find);
  }

  Future<List<SituationOptions>> findByOptionList(List<Option> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Option model in models) {
      find.or(this.optionsId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByOption(String optionsId) async {
    final Remove rm = remover.where(this.optionsId.eq(optionsId));
    return await adapter.remove(rm);
  }

  void associateOption(SituationOptions child, Option parent) {
    child.optionsId = parent.id;
  }

  Future<int> detachOption(Option model) async {
    final dels = await findByOption(model.id);
    if (dels.isNotEmpty) {
      await removeByOption(model.id);
      final exp = Or();
      for (final t in dels) {
        exp.or(situationBean.id.eq(t.situationId));
      }
      return await situationBean.removeWhere(exp);
    }
    return 0;
  }

  Future<List<Situation>> fetchByOption(Option model) async {
    final pivots = await findByOption(model.id);
// Return if model has no pivots. If this is not done, all records will be removed!
    if (pivots.isEmpty) return [];
    final exp = Or();
    for (final t in pivots) {
      exp.or(situationBean.id.eq(t.situationId));
    }
    return await situationBean.findWhere(exp);
  }

  Future<dynamic> attach(Situation one, Option two,
      {bool upsert = false}) async {
    final ret = SituationOptions();
    ret.situationId = one.id;
    ret.optionsId = two.id;
    if (!upsert) {
      return insert(ret);
    } else {
      return this.upsert(ret);
    }
  }

  SituationBean get situationBean;
  OptionBean get optionBean;
}

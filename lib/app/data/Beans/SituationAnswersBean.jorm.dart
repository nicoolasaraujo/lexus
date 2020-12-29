// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SituationAnswersBean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _SituationAnswersBean implements Bean<SituationAnswer> {
  final id = StrField('id');
  final acitivityAnswerId = StrField('acitivity_answer_id');
  final situationid = StrField('situationid');
  final optionId = StrField('option_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        acitivityAnswerId.name: acitivityAnswerId,
        situationid.name: situationid,
        optionId.name: optionId,
      };
  SituationAnswer fromMap(Map map) {
    SituationAnswer model = SituationAnswer();
    model.id = adapter.parseValue(map['id']);
    model.acitivityAnswerId = adapter.parseValue(map['acitivity_answer_id']);
    model.situationid = adapter.parseValue(map['situationid']);
    model.optionId = adapter.parseValue(map['option_id']);

    return model;
  }

  List<SetColumn> toSetColumns(SituationAnswer model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(acitivityAnswerId.set(model.acitivityAnswerId));
      ret.add(situationid.set(model.situationid));
      ret.add(optionId.set(model.optionId));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(acitivityAnswerId.name))
        ret.add(acitivityAnswerId.set(model.acitivityAnswerId));
      if (only.contains(situationid.name))
        ret.add(situationid.set(model.situationid));
      if (only.contains(optionId.name)) ret.add(optionId.set(model.optionId));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.acitivityAnswerId != null) {
        ret.add(acitivityAnswerId.set(model.acitivityAnswerId));
      }
      if (model.situationid != null) {
        ret.add(situationid.set(model.situationid));
      }
      if (model.optionId != null) {
        ret.add(optionId.set(model.optionId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addStr(acitivityAnswerId.name,
        foreignTable: classActivityAnswerBean.tableName,
        foreignCol: classActivityAnswerBean.id.name,
        isNullable: false);
    st.addStr(situationid.name,
        foreignTable: situationBean.tableName,
        foreignCol: situationBean.id.name,
        isNullable: false);
    st.addStr(optionId.name,
        foreignTable: optionBean.tableName,
        foreignCol: optionBean.id.name,
        isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(SituationAnswer model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<SituationAnswer> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(SituationAnswer model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      isForeignKeyEnabled = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<SituationAnswer> models,
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

  Future<int> update(SituationAnswer model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<SituationAnswer> models,
      {bool onlyNonNull = false, Set<String> only}) async {
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

  Future<SituationAnswer> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(String id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<SituationAnswer> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<List<SituationAnswer>> findByClassActivityAnswer(
      String acitivityAnswerId,
      {bool preload = false,
      bool cascade = false}) async {
    final Find find =
        finder.where(this.acitivityAnswerId.eq(acitivityAnswerId));
    return findMany(find);
  }

  Future<List<SituationAnswer>> findByClassActivityAnswerList(
      List<ClassActivityAnswer> models,
      {bool preload = false,
      bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (ClassActivityAnswer model in models) {
      find.or(this.acitivityAnswerId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByClassActivityAnswer(String acitivityAnswerId) async {
    final Remove rm =
        remover.where(this.acitivityAnswerId.eq(acitivityAnswerId));
    return await adapter.remove(rm);
  }

  void associateClassActivityAnswer(
      SituationAnswer child, ClassActivityAnswer parent) {
    child.acitivityAnswerId = parent.id;
  }

  Future<List<SituationAnswer>> findBySituation(String situationid,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.situationid.eq(situationid));
    return findMany(find);
  }

  Future<List<SituationAnswer>> findBySituationList(List<Situation> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Situation model in models) {
      find.or(this.situationid.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeBySituation(String situationid) async {
    final Remove rm = remover.where(this.situationid.eq(situationid));
    return await adapter.remove(rm);
  }

  void associateSituation(SituationAnswer child, Situation parent) {
    child.situationid = parent.id;
  }

  Future<List<SituationAnswer>> findByOption(String optionId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.optionId.eq(optionId));
    return findMany(find);
  }

  Future<List<SituationAnswer>> findByOptionList(List<Option> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Option model in models) {
      find.or(this.optionId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByOption(String optionId) async {
    final Remove rm = remover.where(this.optionId.eq(optionId));
    return await adapter.remove(rm);
  }

  void associateOption(SituationAnswer child, Option parent) {
    child.optionId = parent.id;
  }

  ClassActivityAnswerBean get classActivityAnswerBean;
  SituationBean get situationBean;
  OptionBean get optionBean;
}

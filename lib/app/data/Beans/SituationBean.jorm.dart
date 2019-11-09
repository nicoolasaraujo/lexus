// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SituationBean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _SituationBean implements Bean<Situation> {
  final id = StrField('id');
  final title = StrField('title');
  final question = StrField('question');
  final placeId = StrField('place_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        title.name: title,
        question.name: question,
        placeId.name: placeId,
      };
  Situation fromMap(Map map) {
    Situation model = Situation();
    model.id = adapter.parseValue(map['id']);
    model.title = adapter.parseValue(map['title']);
    model.question = adapter.parseValue(map['question']);
    model.placeId = adapter.parseValue(map['place_id']);

    return model;
  }

  List<SetColumn> toSetColumns(Situation model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(title.set(model.title));
      ret.add(question.set(model.question));
      ret.add(placeId.set(model.placeId));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(title.name)) ret.add(title.set(model.title));
      if (only.contains(question.name)) ret.add(question.set(model.question));
      if (only.contains(placeId.name)) ret.add(placeId.set(model.placeId));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.title != null) {
        ret.add(title.set(model.title));
      }
      if (model.question != null) {
        ret.add(question.set(model.question));
      }
      if (model.placeId != null) {
        ret.add(placeId.set(model.placeId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addStr(title.name, isNullable: false);
    st.addStr(question.name, isNullable: false);
    st.addStr(placeId.name,
        foreignTable: placeBean.tableName, foreignCol: 'id', isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Situation model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      Situation newModel;
      if (model.classAcitivty != null) {
        newModel ??= await find(model.id);
        for (final child in model.classAcitivty) {
          await classActivityBean.insert(child, cascade: cascade);
          await classSituationBean.attach(newModel, child);
        }
      }
      if (model.options != null) {
        newModel ??= await find(model.id);
        for (final child in model.options) {
          await optionBean.insert(child, cascade: cascade);
          await situationOptionsBean.attach(newModel, child);
        }
      }
      if (model.situationsAnswers != null) {
        newModel ??= await find(model.id);
        model.situationsAnswers.forEach(
            (x) => situationAnswerBean.associateSituation(x, newModel));
        for (final child in model.situationsAnswers) {
          await situationAnswerBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Situation> models,
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

  Future<dynamic> upsert(Situation model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Situation newModel;
      if (model.classAcitivty != null) {
        newModel ??= await find(model.id);
        for (final child in model.classAcitivty) {
          await classActivityBean.upsert(child, cascade: cascade);
          await classSituationBean.attach(newModel, child, upsert: true);
        }
      }
      if (model.options != null) {
        newModel ??= await find(model.id);
        for (final child in model.options) {
          await optionBean.upsert(child, cascade: cascade);
          await situationOptionsBean.attach(newModel, child, upsert: true);
        }
      }
      if (model.situationsAnswers != null) {
        newModel ??= await find(model.id);
        model.situationsAnswers.forEach(
            (x) => situationAnswerBean.associateSituation(x, newModel));
        for (final child in model.situationsAnswers) {
          await situationAnswerBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Situation> models,
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

  Future<int> update(Situation model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Situation newModel;
      if (model.classAcitivty != null) {
        for (final child in model.classAcitivty) {
          await classActivityBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
      if (model.options != null) {
        for (final child in model.options) {
          await optionBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
      if (model.situationsAnswers != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.situationsAnswers.forEach(
              (x) => situationAnswerBean.associateSituation(x, newModel));
        }
        for (final child in model.situationsAnswers) {
          await situationAnswerBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Situation> models,
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

  Future<Situation> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Situation model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(String id, {bool cascade = false}) async {
    if (cascade) {
      final Situation newModel = await find(id);
      if (newModel != null) {
        await classSituationBean.detachSituation(newModel);
        await situationOptionsBean.detachSituation(newModel);
        await situationAnswerBean.removeBySituation(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Situation> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<List<Situation>> findByPlace(String placeId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.placeId.eq(placeId));
    final List<Situation> models = await findMany(find);
    if (preload) {
      await this.preloadAll(models, cascade: cascade);
    }
    return models;
  }

  Future<List<Situation>> findByPlaceList(List<Place> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Place model in models) {
      find.or(this.placeId.eq(model.id));
    }
    final List<Situation> retModels = await findMany(find);
    if (preload) {
      await this.preloadAll(retModels, cascade: cascade);
    }
    return retModels;
  }

  Future<int> removeByPlace(String placeId) async {
    final Remove rm = remover.where(this.placeId.eq(placeId));
    return await adapter.remove(rm);
  }

  void associatePlace(Situation child, Place parent) {
    child.placeId = parent.id;
  }

  Future<Situation> preload(Situation model, {bool cascade = false}) async {
    model.classAcitivty = await classSituationBean.fetchBySituation(model);
    model.options = await situationOptionsBean.fetchBySituation(model);
    model.situationsAnswers = await situationAnswerBean
        .findBySituation(model.id, preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<Situation>> preloadAll(List<Situation> models,
      {bool cascade = false}) async {
    for (Situation model in models) {
      var temp = await classSituationBean.fetchBySituation(model);
      if (model.classAcitivty == null)
        model.classAcitivty = temp;
      else {
        model.classAcitivty.clear();
        model.classAcitivty.addAll(temp);
      }
    }
    for (Situation model in models) {
      var temp = await situationOptionsBean.fetchBySituation(model);
      if (model.options == null)
        model.options = temp;
      else {
        model.options.clear();
        model.options.addAll(temp);
      }
    }
    models.forEach((Situation model) => model.situationsAnswers ??= []);
    await OneToXHelper.preloadAll<Situation, SituationAnswer>(
        models,
        (Situation model) => [model.id],
        situationAnswerBean.findBySituationList,
        (SituationAnswer model) => [model.situationid],
        (Situation model, SituationAnswer child) => model.situationsAnswers =
            List.from(model.situationsAnswers)..add(child),
        cascade: cascade);
    return models;
  }

  ClassSituationBean get classSituationBean;

  ClassActivityBean get classActivityBean;
  SituationOptionsBean get situationOptionsBean;

  OptionBean get optionBean;
  SituationAnswersBean get situationAnswerBean;
  PlaceBean get placeBean;
}

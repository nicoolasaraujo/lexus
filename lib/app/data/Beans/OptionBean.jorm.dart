// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OptionBean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _OptionBean implements Bean<Option> {
  final id = StrField('id');
  final description = StrField('description');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        description.name: description,
      };
  Option fromMap(Map map) {
    Option model = Option();
    model.id = adapter.parseValue(map['id']);
    model.description = adapter.parseValue(map['description']);

    return model;
  }

  List<SetColumn> toSetColumns(Option model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(description.set(model.description));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(description.name))
        ret.add(description.set(model.description));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.description != null) {
        ret.add(description.set(model.description));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addStr(description.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Option model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      Option newModel;
      if (model.situations != null) {
        newModel ??= await find(model.id);
        for (final child in model.situations) {
          await situationBean.insert(child, cascade: cascade);
          await situationOptionsBean.attach(child, newModel);
        }
      }
      if (model.situationsAnswers != null) {
        newModel ??= await find(model.id);
        model.situationsAnswers
            .forEach((x) => situationAnswerBean.associateOption(x, newModel));
        for (final child in model.situationsAnswers) {
          await situationAnswerBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Option> models,
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

  Future<dynamic> upsert(Option model,
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
      Option newModel;
      if (model.situations != null) {
        newModel ??= await find(model.id);
        for (final child in model.situations) {
          await situationBean.upsert(child, cascade: cascade);
          await situationOptionsBean.attach(child, newModel, upsert: true);
        }
      }
      if (model.situationsAnswers != null) {
        newModel ??= await find(model.id);
        model.situationsAnswers
            .forEach((x) => situationAnswerBean.associateOption(x, newModel));
        for (final child in model.situationsAnswers) {
          await situationAnswerBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Option> models,
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

  Future<int> update(Option model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Option newModel;
      if (model.situations != null) {
        for (final child in model.situations) {
          await situationBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
      if (model.situationsAnswers != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.situationsAnswers
              .forEach((x) => situationAnswerBean.associateOption(x, newModel));
        }
        for (final child in model.situationsAnswers) {
          await situationAnswerBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Option> models,
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

  Future<Option> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Option model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(String id, {bool cascade = false}) async {
    if (cascade) {
      final Option newModel = await find(id);
      if (newModel != null) {
        await situationOptionsBean.detachOption(newModel);
        await situationAnswerBean.removeByOption(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Option> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<Option> preload(Option model, {bool cascade = false}) async {
    model.situations = await situationOptionsBean.fetchByOption(model);
    model.situationsAnswers = await situationAnswerBean.findByOption(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<Option>> preloadAll(List<Option> models,
      {bool cascade = false}) async {
    for (Option model in models) {
      var temp = await situationOptionsBean.fetchByOption(model);
      if (model.situations == null)
        model.situations = temp;
      else {
        model.situations.clear();
        model.situations.addAll(temp);
      }
    }
    models.forEach((Option model) => model.situationsAnswers ??= []);
    await OneToXHelper.preloadAll<Option, SituationAnswer>(
        models,
        (Option model) => [model.id],
        situationAnswerBean.findByOptionList,
        (SituationAnswer model) => [model.optionId],
        (Option model, SituationAnswer child) => model.situationsAnswers =
            List.from(model.situationsAnswers)..add(child),
        cascade: cascade);
    return models;
  }

  SituationOptionsBean get situationOptionsBean;

  SituationBean get situationBean;
  SituationAnswersBean get situationAnswerBean;
}

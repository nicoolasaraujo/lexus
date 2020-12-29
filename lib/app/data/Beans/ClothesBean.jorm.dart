// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClothesBean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ClothesBean implements Bean<Clothes> {
  final id = StrField('id');
  final imgPath = StrField('img_path');
  final description = StrField('description');
  final gender = IntField('gender');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        imgPath.name: imgPath,
        description.name: description,
        gender.name: gender,
      };
  Clothes fromMap(Map map) {
    Clothes model = Clothes();
    model.id = adapter.parseValue(map['id']);
    model.imgPath = adapter.parseValue(map['img_path']);
    model.description = adapter.parseValue(map['description']);
    model.gender = adapter.parseValue(map['gender']);

    return model;
  }

  List<SetColumn> toSetColumns(Clothes model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(imgPath.set(model.imgPath));
      ret.add(description.set(model.description));
      ret.add(gender.set(model.gender));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(imgPath.name)) ret.add(imgPath.set(model.imgPath));
      if (only.contains(description.name))
        ret.add(description.set(model.description));
      if (only.contains(gender.name)) ret.add(gender.set(model.gender));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.imgPath != null) {
        ret.add(imgPath.set(model.imgPath));
      }
      if (model.description != null) {
        ret.add(description.set(model.description));
      }
      if (model.gender != null) {
        ret.add(gender.set(model.gender));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addStr(imgPath.name, isNullable: false);
    st.addStr(description.name, isNullable: false);
    st.addInt(gender.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Clothes model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      Clothes newModel;
      if (model.places != null) {
        newModel ??= await find(model.id);
        for (final child in model.places) {
          await placeBean.insert(child, cascade: cascade);
          await placeClothesBean.attach(child, newModel);
        }
      }
      if (model.classanswers != null) {
        newModel ??= await find(model.id);
        model.classanswers.forEach(
            (x) => classActivityAnswerBean.associateClothes(x, newModel));
        for (final child in model.classanswers) {
          await classActivityAnswerBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Clothes> models,
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

  Future<dynamic> upsert(Clothes model,
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
      Clothes newModel;
      if (model.places != null) {
        newModel ??= await find(model.id);
        for (final child in model.places) {
          await placeBean.upsert(child, cascade: cascade);
          await placeClothesBean.attach(child, newModel, upsert: true);
        }
      }
      if (model.classanswers != null) {
        newModel ??= await find(model.id);
        model.classanswers.forEach(
            (x) => classActivityAnswerBean.associateClothes(x, newModel));
        for (final child in model.classanswers) {
          await classActivityAnswerBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Clothes> models,
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

  Future<int> update(Clothes model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Clothes newModel;
      if (model.places != null) {
        for (final child in model.places) {
          await placeBean.update(child, cascade: cascade, associate: associate);
        }
      }
      if (model.classanswers != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.classanswers.forEach(
              (x) => classActivityAnswerBean.associateClothes(x, newModel));
        }
        for (final child in model.classanswers) {
          await classActivityAnswerBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Clothes> models,
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

  Future<Clothes> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Clothes model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(String id, {bool cascade = false}) async {
    if (cascade) {
      final Clothes newModel = await find(id);
      if (newModel != null) {
        await placeClothesBean.detachClothes(newModel);
        await classActivityAnswerBean.removeByClothes(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Clothes> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<Clothes> preload(Clothes model, {bool cascade = false}) async {
    model.places = await placeClothesBean.fetchByClothes(model);
    model.classanswers = await classActivityAnswerBean.findByClothes(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<Clothes>> preloadAll(List<Clothes> models,
      {bool cascade = false}) async {
    for (Clothes model in models) {
      var temp = await placeClothesBean.fetchByClothes(model);
      if (model.places == null)
        model.places = temp;
      else {
        model.places.clear();
        model.places.addAll(temp);
      }
    }
    models.forEach((Clothes model) => model.classanswers ??= []);
    await OneToXHelper.preloadAll<Clothes, ClassActivityAnswer>(
        models,
        (Clothes model) => [model.id],
        classActivityAnswerBean.findByClothesList,
        (ClassActivityAnswer model) => [model.clothesId],
        (Clothes model, ClassActivityAnswer child) =>
            model.classanswers = List.from(model.classanswers)..add(child),
        cascade: cascade);
    return models;
  }

  PlaceClothesBean get placeClothesBean;

  PlaceBean get placeBean;
  ClassActivityAnswerBean get classActivityAnswerBean;
}

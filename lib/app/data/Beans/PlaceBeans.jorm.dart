// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlaceBeans.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _PlaceBean implements Bean<Place> {
  final id = StrField('id');
  final imgPath = StrField('img_path');
  final description = StrField('description');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        imgPath.name: imgPath,
        description.name: description,
      };
  Place fromMap(Map map) {
    Place model = Place();
    model.id = adapter.parseValue(map['id']);
    model.imgPath = adapter.parseValue(map['img_path']);
    model.description = adapter.parseValue(map['description']);

    return model;
  }

  List<SetColumn> toSetColumns(Place model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(imgPath.set(model.imgPath));
      ret.add(description.set(model.description));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(imgPath.name)) ret.add(imgPath.set(model.imgPath));
      if (only.contains(description.name))
        ret.add(description.set(model.description));
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
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addStr(imgPath.name, isNullable: false);
    st.addStr(description.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Place model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      Place newModel;
      if (model.placesClothes != null) {
        newModel ??= await find(model.id);
        for (final child in model.placesClothes) {
          await clothesBean.insert(child, cascade: cascade);
          await placeClothesBean.attach(newModel, child);
        }
      }
      if (model.situations != null) {
        newModel ??= await find(model.id);
        model.situations
            .forEach((x) => situationBean.associatePlace(x, newModel));
        for (final child in model.situations) {
          await situationBean.insert(child, cascade: cascade);
        }
      }
      if (model.classanswers != null) {
        newModel ??= await find(model.id);
        model.classanswers.forEach(
            (x) => classActivityAnswerBean.associatePlace(x, newModel));
        for (final child in model.classanswers) {
          await classActivityAnswerBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Place> models,
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

  Future<dynamic> upsert(Place model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Place newModel;
      if (model.placesClothes != null) {
        newModel ??= await find(model.id);
        for (final child in model.placesClothes) {
          await clothesBean.upsert(child, cascade: cascade);
          await placeClothesBean.attach(newModel, child, upsert: true);
        }
      }
      if (model.situations != null) {
        newModel ??= await find(model.id);
        model.situations
            .forEach((x) => situationBean.associatePlace(x, newModel));
        for (final child in model.situations) {
          await situationBean.upsert(child, cascade: cascade);
        }
      }
      if (model.classanswers != null) {
        newModel ??= await find(model.id);
        model.classanswers.forEach(
            (x) => classActivityAnswerBean.associatePlace(x, newModel));
        for (final child in model.classanswers) {
          await classActivityAnswerBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Place> models,
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

  Future<int> update(Place model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Place newModel;
      if (model.placesClothes != null) {
        for (final child in model.placesClothes) {
          await clothesBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
      if (model.situations != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.situations
              .forEach((x) => situationBean.associatePlace(x, newModel));
        }
        for (final child in model.situations) {
          await situationBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
      if (model.classanswers != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.classanswers.forEach(
              (x) => classActivityAnswerBean.associatePlace(x, newModel));
        }
        for (final child in model.classanswers) {
          await classActivityAnswerBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Place> models,
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

  Future<Place> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Place model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(String id, {bool cascade = false}) async {
    if (cascade) {
      final Place newModel = await find(id);
      if (newModel != null) {
        await placeClothesBean.detachPlace(newModel);
        await situationBean.removeByPlace(newModel.id);
        await classActivityAnswerBean.removeByPlace(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Place> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<Place> preload(Place model, {bool cascade = false}) async {
    model.placesClothes = await placeClothesBean.fetchByPlace(model);
    model.situations = await situationBean.findByPlace(model.id,
        preload: cascade, cascade: cascade);
    model.classanswers = await classActivityAnswerBean.findByPlace(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<Place>> preloadAll(List<Place> models,
      {bool cascade = false}) async {
    for (Place model in models) {
      var temp = await placeClothesBean.fetchByPlace(model);
      if (model.placesClothes == null)
        model.placesClothes = temp;
      else {
        model.placesClothes.clear();
        model.placesClothes.addAll(temp);
      }
    }
    models.forEach((Place model) => model.situations ??= []);
    await OneToXHelper.preloadAll<Place, Situation>(
        models,
        (Place model) => [model.id],
        situationBean.findByPlaceList,
        (Situation model) => [model.placeId],
        (Place model, Situation child) =>
            model.situations = List.from(model.situations)..add(child),
        cascade: cascade);
    models.forEach((Place model) => model.classanswers ??= []);
    await OneToXHelper.preloadAll<Place, ClassActivityAnswer>(
        models,
        (Place model) => [model.id],
        classActivityAnswerBean.findByPlaceList,
        (ClassActivityAnswer model) => [model.placeId],
        (Place model, ClassActivityAnswer child) =>
            model.classanswers = List.from(model.classanswers)..add(child),
        cascade: cascade);
    return models;
  }

  PlaceClothesBean get placeClothesBean;

  ClothesBean get clothesBean;
  SituationBean get situationBean;
  ClassActivityAnswerBean get classActivityAnswerBean;
}

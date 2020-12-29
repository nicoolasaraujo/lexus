// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlaceClothesBean.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _PlaceClothesBean implements Bean<PlaceClothes> {
  final placeId = StrField('place_id');
  final clothesId = StrField('clothes_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        placeId.name: placeId,
        clothesId.name: clothesId,
      };
  PlaceClothes fromMap(Map map) {
    PlaceClothes model = PlaceClothes();
    model.placeId = adapter.parseValue(map['place_id']);
    model.clothesId = adapter.parseValue(map['clothes_id']);

    return model;
  }

  List<SetColumn> toSetColumns(PlaceClothes model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(placeId.set(model.placeId));
      ret.add(clothesId.set(model.clothesId));
    } else if (only != null) {
      if (only.contains(placeId.name)) ret.add(placeId.set(model.placeId));
      if (only.contains(clothesId.name))
        ret.add(clothesId.set(model.clothesId));
    } else /* if (onlyNonNull) */ {
      if (model.placeId != null) {
        ret.add(placeId.set(model.placeId));
      }
      if (model.clothesId != null) {
        ret.add(clothesId.set(model.clothesId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(placeId.name,
        foreignTable: placeBean.tableName,
        foreignCol: placeBean.id.name,
        isNullable: false);
    st.addStr(clothesId.name,
        foreignTable: clothesBean.tableName,
        foreignCol: clothesBean.id.name,
        isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(PlaceClothes model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<PlaceClothes> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(PlaceClothes model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      isForeignKeyEnabled = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<PlaceClothes> models,
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

  Future<void> updateMany(List<PlaceClothes> models,
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

  Future<List<PlaceClothes>> findByPlace(String placeId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.placeId.eq(placeId));
    return findMany(find);
  }

  Future<List<PlaceClothes>> findByPlaceList(List<Place> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Place model in models) {
      find.or(this.placeId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByPlace(String placeId) async {
    final Remove rm = remover.where(this.placeId.eq(placeId));
    return await adapter.remove(rm);
  }

  void associatePlace(PlaceClothes child, Place parent) {
    child.placeId = parent.id;
  }

  Future<int> detachPlace(Place model) async {
    final dels = await findByPlace(model.id);
    if (dels.isNotEmpty) {
      await removeByPlace(model.id);
      final exp = Or();
      for (final t in dels) {
        exp.or(clothesBean.id.eq(t.clothesId));
      }
      return await clothesBean.removeWhere(exp);
    }
    return 0;
  }

  Future<List<Clothes>> fetchByPlace(Place model) async {
    final pivots = await findByPlace(model.id);
// Return if model has no pivots. If this is not done, all records will be removed!
    if (pivots.isEmpty) return [];
    final exp = Or();
    for (final t in pivots) {
      exp.or(clothesBean.id.eq(t.clothesId));
    }
    return await clothesBean.findWhere(exp);
  }

  Future<List<PlaceClothes>> findByClothes(String clothesId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.clothesId.eq(clothesId));
    return findMany(find);
  }

  Future<List<PlaceClothes>> findByClothesList(List<Clothes> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Clothes model in models) {
      find.or(this.clothesId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByClothes(String clothesId) async {
    final Remove rm = remover.where(this.clothesId.eq(clothesId));
    return await adapter.remove(rm);
  }

  void associateClothes(PlaceClothes child, Clothes parent) {
    child.clothesId = parent.id;
  }

  Future<int> detachClothes(Clothes model) async {
    final dels = await findByClothes(model.id);
    if (dels.isNotEmpty) {
      await removeByClothes(model.id);
      final exp = Or();
      for (final t in dels) {
        exp.or(placeBean.id.eq(t.placeId));
      }
      return await placeBean.removeWhere(exp);
    }
    return 0;
  }

  Future<List<Place>> fetchByClothes(Clothes model) async {
    final pivots = await findByClothes(model.id);
// Return if model has no pivots. If this is not done, all records will be removed!
    if (pivots.isEmpty) return [];
    final exp = Or();
    for (final t in pivots) {
      exp.or(placeBean.id.eq(t.placeId));
    }
    return await placeBean.findWhere(exp);
  }

  Future<dynamic> attach(Place one, Clothes two, {bool upsert = false}) async {
    final ret = PlaceClothes();
    ret.placeId = one.id;
    ret.clothesId = two.id;
    if (!upsert) {
      return insert(ret);
    } else {
      return this.upsert(ret);
    }
  }

  PlaceBean get placeBean;
  ClothesBean get clothesBean;
}

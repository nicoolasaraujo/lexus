import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:lexus/app/app_module.dart';
import 'package:lexus/app/data/Beans/PlaceBeans.dart';
import 'package:lexus/app/model/place.dart';
import 'package:rxdart/rxdart.dart';

class PlaceBloc extends BlocBase {
  List<Place> placeList = [];
  Place selectedPlace;

  var _places = BehaviorSubject<List<Place>>();
  BehaviorSubject<Place> _selectedPlace = BehaviorSubject<Place>();

  void loadPlace() async {
    await adapter.connect();
    this.bean = PlaceBean(adapter);
    Find find = this.bean.finder;
    find.or(this.bean.situationBean.id.eq('1'));

    var response = await this.bean.findMany(find);
    this.placeList.addAll(response);
    // print('Place returned: ${data.description} ');
    this.inPlaceList.add(this.placeList);
  }

  void changeSelectedPlace(int index) {
    this.selectedPlace = this.placeList[index];
    this.inSelectedPlace.add(selectedPlace);
  }

  Observable<List<Place>> get outPlaceList => this._places.stream;
  Sink<List<Place>> get inPlaceList => this._places.sink;

  Observable<Place> get outSelectedPlace => this._selectedPlace.stream;
  Sink<Place> get inSelectedPlace => this._selectedPlace.sink;

  var adapter = AppModule.to.getDependency<SqfliteAdapter>();
  PlaceBean bean;

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    this._places.sink.close();
    this._selectedPlace.close();
    super.dispose();
  }
}

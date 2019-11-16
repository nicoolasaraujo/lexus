import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/model/place.dart';
import 'package:lexus/app/pages/ClassActivity/subpages/ClassActivityAnswer/class_bloc.dart';
import 'package:lexus/app/repositories/PlaceRepository.dart';
import 'package:rxdart/rxdart.dart';

class PlaceBloc extends BlocBase {
  List<Place> _placeList = [];
  Place selectedPlace;

  ClassAnswerBloc _classAnswerBloc;
  PlaceRepository _placeRepository;
  
  PlaceBloc(this._classAnswerBloc, this._placeRepository);


  var _places = BehaviorSubject<List<Place>>();
  BehaviorSubject<Place> _selectedPlace = BehaviorSubject<Place>();

  void loadPlace() async {
    this._placeList	 = await this._placeRepository.getPlacesByClassActivity(this._classAnswerBloc.userAnswer.classAcitviyId);
    this.inPlaceList.add(this._placeList);
  }

  void changeSelectedPlace(int index) {
    this.selectedPlace = this._placeList[index];
    this.inSelectedPlace.add(selectedPlace);
  }

  Observable<List<Place>> get outPlaceList => this._places.stream;
  Sink<List<Place>> get inPlaceList => this._places.sink;

  Observable<Place> get outSelectedPlace => this._selectedPlace.stream;
  Sink<Place> get inSelectedPlace => this._selectedPlace.sink;

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    this._places.sink.close();
    this._selectedPlace.close();
    super.dispose();
  }
}

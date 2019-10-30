import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class PlaceBloc extends BlocBase {
  List<Place> PlaceList = [];
  var _Places = BehaviorSubject<List<Place>>();
  var _selectedPlace = BehaviorSubject<Place>();

  // = [Place(0, "Masculino", "assets/img/man.png"), Place(1, "Feminino", "assets/img/woman.png") ];

  void loadPlace() {
    this.PlaceList = [
      Place(0, "Padaria", "assets/img/padaria.jfif"),
      Place(1, "Shopping", "assets/img/shopping.jfif"),
      Place(2, "Feira", "assets/img/feira.jpeg"),
      Place(3, "Concessionaria", "assets/img/concessionario carros.jfif")
    ];
    this.inPlaceList.add(this.PlaceList);
  }

  void changeSelectedPlace(int index) {
    var x = this.PlaceList[index];
    this.inSelectedPlace.add(x);
  }

  Observable<List<Place>> get outPlaceList => this._Places.stream;
  Sink<List<Place>> get inPlaceList => this._Places.sink;

  Observable<Place> get outSelectedPlace => this._selectedPlace.stream;
  Sink<Place> get inSelectedPlace => this._selectedPlace.sink;

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    this._Places.sink.close();
    this._selectedPlace.sink.close();
    super.dispose();
  }
}

class Place {
  int id;
  String description;
  String imgPath;
  Place(this.id, this.description, this.imgPath);
}

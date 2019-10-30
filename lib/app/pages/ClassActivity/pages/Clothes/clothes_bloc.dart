import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class ClothesBloc extends BlocBase {

  Observable<List<Clothes>> get outClothesList => this._clothesListController.stream;
  Sink<List<Clothes>>  get inClothesList => this._clothesListController.sink;

  Observable<Clothes> get outSelectedClothes => this._selectedClothesController.stream;
  Sink<Clothes> get inSelectedClothes => this._selectedClothesController.sink;


  Clothes _selectedClothes;
  var _selectedClothesController = BehaviorSubject<Clothes>();

  List<Clothes> _clothesList;
  var _clothesListController = BehaviorSubject<List<Clothes>>();

  void changeSelectedClothes(int index){
    this._selectedClothes = _clothesList[index];
    this.inSelectedClothes.add(this._selectedClothes);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }

  void loadClothes() {
    this._clothesList = [
      Clothes(1, "Camisa", "assets/img/cold.png"), 
      Clothes(2, "Blusa", "assets/img/cold.png"), 
      Clothes(3, "Jaqueta", "assets/img/cold.png"), 
      Clothes(4, "Camisa Social", "assets/img/cold.png")
    ];

    this.inClothesList.add(this._clothesList);
  }
}

class Clothes {
  String description;
  int id;
  String imgPath;

  Clothes(this.id, this.description, this.imgPath);
}
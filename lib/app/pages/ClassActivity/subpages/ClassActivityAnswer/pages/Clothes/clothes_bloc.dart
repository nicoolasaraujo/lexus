import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/model/Clothes.dart';
import 'package:lexus/app/pages/ClassActivity/subpages/ClassActivityAnswer/class_bloc.dart';
import 'package:lexus/app/repositories/ClothesRepository.dart';
import 'package:rxdart/rxdart.dart';

class ClothesBloc extends BlocBase {
  ClassAnswerBloc _answerBloc;
  ClothesRepository _clothesRepository;
  ClothesBloc(this._answerBloc, this._clothesRepository);

  Observable<List<Clothes>> get outClothesList =>
      this._clothesListController.stream;
  Sink<List<Clothes>> get inClothesList => this._clothesListController.sink;

  Observable<Clothes> get outSelectedClothes =>
      this._selectedClothesController.stream;
  Sink<Clothes> get inSelectedClothes => this._selectedClothesController.sink;

  Clothes _selectedClothes;
  var _selectedClothesController = BehaviorSubject<Clothes>();

  List<Clothes> _clothesList;
  var _clothesListController = BehaviorSubject<List<Clothes>>();

  var _hasSelected = BehaviorSubject<bool>();

  Observable<bool> get hasSelected => this._hasSelected.stream;

  void changeSelectedClothes(int index) {
    if (this._selectedClothes == null){
      this._hasSelected.sink.add(true);
    }
    this._selectedClothes = _clothesList[index];
    this.inSelectedClothes.add(this._selectedClothes);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    this._selectedClothesController.sink.close();
    super.dispose();
  }

  void forwardQuestion(){
    this._answerBloc.userAnswer.setClothes(this._selectedClothes);
    this._answerBloc.loadSituations();
  }

  void loadClothes() async {
    this._clothesList = await this
        ._clothesRepository
        .findClothesByPlace(this._answerBloc.userAnswer.placeId);
    this.inClothesList.add(this._clothesList);
  }
}

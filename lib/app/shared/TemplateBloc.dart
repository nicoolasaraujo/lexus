import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

abstract class ItemsBloc<T> extends BlocBase {
  List<T> _itemsList = [];
  var _items = BehaviorSubject<List<T>>();
  var _selectedItem = BehaviorSubject<T>();

  Observable<List<T>> get outItemList => this._items.stream;
  Sink<List<T>> get inItemList => this._items.sink;

  Observable<T> get outSelectedItem => this._selectedItem.stream;
  Sink<T> get inSelectedItem => this._selectedItem.sink;


  set setItems(List<T> newList){
    this._itemsList = newList;
    this.inItemList.add(this._itemsList);
  }

  void changeSelectedItem(int index){
    this._selectedItem.sink.add(this._itemsList[index]);
  }

  void nextScreen(Function navigateFunction){
    navigateFunction();
  }

  void loadItems();

  @override
  void dispose() {
    this._items.sink.close();
    this._selectedItem.sink.close();
    super.dispose();
  }
}

class ConfirmationResult {
  ConfirmationResult(this.successful, {this.message, this.returnedObject});
  String message;
  bool successful;
  dynamic returnedObject;
}

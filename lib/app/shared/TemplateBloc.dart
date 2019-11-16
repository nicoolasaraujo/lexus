import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

abstract class ItemsBloc<T> extends BlocBase {
  List<T> _itemsList = [];
  T _item;

  var _items = BehaviorSubject<List<T>>();
  var _selectedItem = BehaviorSubject<T>();
  var _hasSelected = BehaviorSubject<bool>();

  Observable<List<T>> get outItemList => this._items.stream;
  Sink<List<T>> get inItemList => this._items.sink;

  Observable<T> get outSelectedItem => this._selectedItem.stream;
  Sink<T> get inSelectedItem => this._selectedItem.sink;

  Observable<bool> get outHasSelected => this._hasSelected.stream;

  set setItems(List<T> newList) {
    this._itemsList = newList;
    this.inItemList.add(this._itemsList);
  }

  void changeSelectedItem(int index) {
    if (this._item == null) {
      this._item = this._itemsList[index];
      this._hasSelected.add(true);
    }

    this._selectedItem.sink.add(this._item);
  }

  void nextScreen(Function navigateFunction) {
    navigateFunction();
  }

  void loadItems();

  @override
  void dispose() {
    this._items.sink.close();
    this._selectedItem.sink.close();
    this._hasSelected.sink.close();
    super.dispose();
  }
}

class ConfirmationResult {
  ConfirmationResult(this.successful, {this.message, this.returnedObject});
  String message;
  bool successful;
  dynamic returnedObject;
}

import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    // this._genders.sink.close();
    // this._selectedGender.sink.close();
    super.dispose();
  }
}

import 'package:bloc_pattern/bloc_pattern.dart';

class TeacherRegisterBloc extends BlocBase {
  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    // this._genders.sink.close();
    // this._selectedGender.sink.close();
    super.dispose();
  }
}

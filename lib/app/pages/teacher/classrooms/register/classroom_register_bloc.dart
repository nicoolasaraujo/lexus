import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/pages/teacher/home/home_bloc.dart';
import 'package:lexus/app/repositories/ClassroomRepository.dart';

class ClassroomRegisterBloc extends BlocBase {
  ClassroomRepository _classroomRepo;
  HomeBloc _homeBloc;

  String test = "testando";
  List<Classroom> classrooms;
  ClassroomRegisterBloc(this._homeBloc, this._classroomRepo);
  @override
  void dispose() {
    // this._genders.sink.close();
    // this._selectedGender.sink.close();
    super.dispose();
  }
}

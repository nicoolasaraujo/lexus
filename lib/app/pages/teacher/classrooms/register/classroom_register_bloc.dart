import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/pages/teacher/home/home_bloc.dart';
import 'package:lexus/app/repositories/ClassroomRepository.dart';

class ClassroomRegisterBloc extends BlocBase {
  ClassroomRepository _classroomRepo;
  HomeBloc homeBloc;

  String test = "testando";
  List<Classroom> classrooms;
  ClassroomRegisterBloc(this.homeBloc, this._classroomRepo);
  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> createClassroom(Classroom classroom) async {
    var returnedValue = await this._classroomRepo.insert(classroom);
    return returnedValue > 0;
  }
}

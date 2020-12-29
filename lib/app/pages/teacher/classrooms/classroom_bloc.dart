import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/model/ClassRoom.dart';
import 'package:lexus/app/pages/teacher/home/home_bloc.dart';
import 'package:lexus/app/repositories/ClassroomRepository.dart';
import 'package:rxdart/rxdart.dart';

class ClassroomBloc extends BlocBase {
  ClassroomRepository _classroomRepo;
  HomeBloc _homeBloc;

  List<Classroom> classrooms;
  ClassroomBloc(this._homeBloc, this._classroomRepo);

  var _listController = BehaviorSubject<List<Classroom>>();
  Sink<List<Classroom>> get inClassrooms => this._listController.sink;
  Observable<List<Classroom>> get outClassrooms => this._listController.stream;

  @override
  void dispose() {
    super.dispose();
  }

  void loadAllClasses() async {
    List<Classroom> response = await this
        ._classroomRepo
        .getClassesByTeacher(this._homeBloc.currentTeacher.id);

    this.inClassrooms.add(response);
  }

  Future<bool> createTeacher(Classroom classToInsert) async {
    try {
      var returnedValue = await this._classroomRepo.insert(classToInsert);
      return returnedValue > 0;
    } catch (error) {
      return false;
    }
  }
}

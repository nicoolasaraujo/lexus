import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/model/Student.dart';
import 'package:lexus/app/pages/teacher/home/home_bloc.dart';
import 'package:lexus/app/repositories/StudentsRepository.dart';
import 'package:rxdart/rxdart.dart';

class StudentBloc extends BlocBase {
  StudentRepository _studentRepo;
  HomeBloc _homeBloc;
  StudentBloc(this._homeBloc, this._studentRepo);

  List<Student> classrooms;
  @override
  void dispose() {
    super.dispose();
  }

  var _listController = BehaviorSubject<List<Student>>();
  Sink<List<Student>> get intStudents => this._listController.sink;
  Observable<List<Student>> get outStudents => this._listController.stream;

  loadAllStudents() async {
    List<Student> response = await this
        ._studentRepo
        .getStudenstByTeacher(this._homeBloc.currentTeacher.id);

    this.intStudents.add(response);
  }
}

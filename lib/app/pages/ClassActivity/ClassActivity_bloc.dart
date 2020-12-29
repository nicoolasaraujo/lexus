import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/model/classActivity.dart';
import 'package:lexus/app/pages/student/student_home_bloc.dart';
import 'package:lexus/app/pages/student/student_home_module.dart';
import 'package:lexus/app/repositories/ClassActivityRepository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class ClassActivityBloc extends BlocBase {
  ClassActivityBloc(this._classRepo);

  ClassActivityRepository _classRepo;
  var homebloc = StudentHomeModule.to.getBloc<StudentHomeBloc>();

  List<ClassActivity> activities;
  ClassActivity selectedActivity;

  var _listController = BehaviorSubject<List<ClassActivity>>();
  Sink<List<ClassActivity>> get inActivities => this._listController.sink;
  Observable<List<ClassActivity>> get ouActivities =>
      this._listController.stream;

  var _listControllerFinished = BehaviorSubject<List<ClassActivity>>();
  Sink<List<ClassActivity>> get inActivitiesFinished =>
      this._listControllerFinished.sink;
  Observable<List<ClassActivity>> get outActivitiesFinished =>
      this._listControllerFinished.stream;

  void loadAllActivities() async {
    List<ClassActivity> response =
        await this._classRepo.getTodoClassesAll(this.homebloc.student.id);

    List<ClassActivity> responseFinished =
        await this._classRepo.getFinishedClasses(this.homebloc.student.id);

    this.inActivities.add(response);
    this.inActivitiesFinished.add(responseFinished);
  }

  @override
  void dispose() {
    super.dispose();
  }

  resetClasses() async {
    await this._classRepo.remveAll();
  }
}

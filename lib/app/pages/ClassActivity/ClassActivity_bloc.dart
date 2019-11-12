import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/model/classActivity.dart';
import 'package:lexus/app/repositories/ClassActivityRepository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class ClassActivityBloc extends BlocBase {
  ClassActivityBloc(this._classRepo);

  ClassActivityRepository _classRepo;

  List<ClassActivity> activities;
  ClassActivity selectedActivity;

  var _listController = BehaviorSubject<List<ClassActivity>>();
  Sink<List<ClassActivity>> get inActivities => this._listController.sink;
  Observable<List<ClassActivity>> get ouActivities => this._listController.stream;

  void loadAllActivities() async{
    List<ClassActivity> response = await this._classRepo.getAll();
    this.activities = List.filled(2, response.first);
    this.inActivities.add(activities);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

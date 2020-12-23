import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';
import 'package:lexus/app/repositories/SituationRepository.dart';
import 'package:uuid/uuid.dart';
import '../../ClassActivity_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ClassAnswerBloc extends BlocBase {
  ClassActivityBloc classAcBloc;
  SituationRepository _situationRepo;

  ClassAnswerBloc(
      ClassActivityBloc classActivityBloc, SituationRepository repository) {
    this.classAcBloc = classActivityBloc;
    this._situationRepo = repository;
    this.userAnswer = ClassActivityAnswer.make(
        Uuid().v1().toString(), DateTime.now(),
        classAcitviyId: this.classAcBloc.selectedActivity.id);
  }

  ClassActivityAnswer userAnswer;
  int totalScreens = 0;
  int finished = 0;
  double progress = 0;

  var _progressController = BehaviorSubject<double>();
  Observable<double> get outProgress => this._progressController.stream;
  Sink<double> get inProgress => this._progressController.sink;

  var _loadedSituations = BehaviorSubject<int>();
  Observable<int> get outIsLoadedSituation => this._loadedSituations.stream;
  Sink<int> get inIsLoadedSituation => this._loadedSituations.sink;

  var _finishedController = BehaviorSubject<int>();
  Observable<int> get outFinishedQuestions => this._finishedController.stream;
  Sink<int> get inFinishedQuestions => this._finishedController.sink;

  @override
  void dispose() {
    this._progressController.close();
    super.dispose();
  }

  void increaseProgress() {
    finished++;
    this._finishedController.add(finished);
    progress = (finished / totalScreens);
    this.inProgress.add(progress);
  }

  void loadSituations() async {
    var response = await this._situationRepo.loadSituationsByPlaceAndActivity(
        this.classAcBloc.selectedActivity.id, this.userAnswer.placeId);
    this.totalScreens += response.length;
    this.inIsLoadedSituation.add(this.totalScreens);
    this.inFinishedQuestions.add(0);
    this.inProgress.add(0);
  }
}

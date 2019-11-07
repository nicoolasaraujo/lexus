import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/model/ClassActivityAnswer.dart';
import 'package:lexus/app/repositories/SituationRepository.dart';
import '../../ClassActivity_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ClassAnswerBloc extends BlocBase {
  ClassActivityBloc classAcBloc;
  SituationRepository _situationRepo;

  ClassAnswerBloc(ClassActivityBloc classActivityBloc, SituationRepository repository) {
    this.classAcBloc = classActivityBloc;
    this._situationRepo = repository;
    this.loadSituations();
  }

  ClassActivityAnswer userAnswer = ClassActivityAnswer();
  int totalScreens;
  int finished = 0;
  double progress = 0;

  var _progressController = BehaviorSubject<double>();
  Observable<double> get outProgress => this._progressController.stream;
  Sink<double> get inProgress => this._progressController.sink;

  @override
  void dispose() {
    this._progressController.close();
    super.dispose();
  }

  void increaseProgress() {
    finished++;
    progress = (finished / totalScreens);
    this.inProgress.add(progress);
  }

  void loadSituations() async {
    this.totalScreens = 3; // 3 because of gender, place and clothes
    var response = await this._situationRepo.findSituationByActivity(this.classAcBloc.selectedActivity.id);
    this.totalScreens += response.length;
  }
}

class Situation {
  int id;
  String description;
  List<String> randomWords;
  String correctWord;

  Situation(this.id, this.description, this.randomWords, this.correctWord);
}

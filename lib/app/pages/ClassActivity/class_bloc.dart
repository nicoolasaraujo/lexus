import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class ClassActivityBloc extends BlocBase{
  int totalScreens = 2;
  int finished = 0;
  double progress = 0;
  
  var _progressController = BehaviorSubject<double>();
  Observable<double> get outProgress => this._progressController.stream;
  Sink<double> get inProgress => this._progressController.sink;

  @override
  void dispose(){
    this._progressController.close();
    super.dispose();
  }

  void increaseProgress() {
    finished++;
    progress = (finished/totalScreens);
    this.inProgress.add(progress);
  }
}

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/pages/ClassActivity/pages/Clothes/clothes_bloc.dart';
import 'package:lexus/app/pages/ClassActivity/pages/Gender/gender_bloc.dart';
import 'package:lexus/app/pages/ClassActivity/pages/Place/place_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ClassActivityBloc extends BlocBase {
  ActivityAnswer userAnswer = ActivityAnswer();
  int totalScreens = 5;
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

class ActivityAnswer{
  Gender selectedGender;
  Clothes selectedClothes;
  Place selectedPlace;
  
}

class Situation{
  int id;
  String description;
  List<String> randomWords;
  String correctWord;
  
  Situation(this.id, this.description, this.randomWords, this.correctWord);
}

class ClassActivity {
  ActivityAnswer userAnswer;
}

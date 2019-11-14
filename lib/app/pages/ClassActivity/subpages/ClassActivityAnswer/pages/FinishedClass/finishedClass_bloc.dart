import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lexus/app/repositories/ClassActivityAnswerRepository.dart';

import '../../class_bloc.dart';

class FinishedClassBloc extends BlocBase{
  ClassAnswerBloc answerBloc;
  ClassActivityAnswerRepository repo;
  FinishedClassBloc(this.answerBloc, this.repo);


  void report(){
    this.repo.report(this.answerBloc.userAnswer.classAcitviyId);
  }
}

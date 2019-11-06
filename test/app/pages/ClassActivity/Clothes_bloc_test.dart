import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:lexus/app/pages/ClassActivity/subpages/ClassActivityAnswer/class_module.dart';
import 'package:lexus/app/pages/ClassActivity/subpages/ClassActivityAnswer/pages/Clothes/clothes_bloc.dart';



void main() {
  initModule(ClassAnswerModule('1'));
  ClothesBloc bloc;

  setUp(() {
    bloc = ClassAnswerModule.to.bloc<ClothesBloc>();
  });

  group('ClothesBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<ClothesBloc>());
    });
  });
}

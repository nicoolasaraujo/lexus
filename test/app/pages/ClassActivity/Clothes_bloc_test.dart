import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:lexus/app/pages/ClassActivity/class_module.dart';
import 'package:lexus/app/pages/ClassActivity/pages/Clothes/clothes_bloc.dart';


void main() {
  initModule(ClassModule());
  ClothesBloc bloc;

  setUp(() {
    bloc = ClassModule.to.bloc<ClothesBloc>();
  });

  group('ClothesBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<ClothesBloc>());
    });
  });
}

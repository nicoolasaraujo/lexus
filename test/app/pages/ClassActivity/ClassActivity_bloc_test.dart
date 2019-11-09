import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:lexus/app/pages/ClassActivity/ClassActivity_bloc.dart';
import 'package:lexus/app/pages/ClassActivity/ClassActivity_module.dart';

void main() {
  initModule(ClassActivityModule());
  ClassActivityBloc bloc;

  setUp(() {
    bloc = ClassActivityModule.to.bloc<ClassActivityBloc>();
  });

  group('ClassActivityBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<ClassActivityBloc>());
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:lexus/app/pages/teacher/home/home_page.dart';

main() {
  testWidgets('HomePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomePage()));
    final titleFinder = find.text('Home');
    expect(titleFinder, findsOneWidget);
  });
}

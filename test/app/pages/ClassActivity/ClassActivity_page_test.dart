import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:lexus/app/pages/ClassActivity/ClassActivity_page.dart';

main() {
  testWidgets('ClassActivityPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(ClassActivityPage(title: 'ClassActivity')));
    final titleFinder = find.text('ClassActivity');
    expect(titleFinder, findsOneWidget);
  });
}

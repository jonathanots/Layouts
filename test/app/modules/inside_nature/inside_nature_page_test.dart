import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:layouts/app/modules/inside_nature/inside_nature_page.dart';

main() {
  testWidgets('InsideNaturePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(InsideNaturePage(title: 'InsideNature')));
    final titleFinder = find.text('InsideNature');
    expect(titleFinder, findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:layouts/app/modules/adoption/adoption_page.dart';

main() {
  testWidgets('AdoptionPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(AdoptionPage(title: 'Adoption')));
    final titleFinder = find.text('Adoption');
    expect(titleFinder, findsOneWidget);
  });
}

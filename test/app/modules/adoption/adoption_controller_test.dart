import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:layouts/app/modules/adoption/adoption_controller.dart';
import 'package:layouts/app/modules/adoption/adoption_module.dart';

void main() {
  initModule(AdoptionModule());
  AdoptionController adoption;

  setUp(() {
    adoption = AdoptionModule.to.get<AdoptionController>();
  });

  group('AdoptionController Test', () {
    test("First Test", () {
      expect(adoption, isInstanceOf<AdoptionController>());
    });

    test("Set Value", () {
      expect(adoption.value, equals(0));
      adoption.increment();
      expect(adoption.value, equals(1));
    });
  });
}

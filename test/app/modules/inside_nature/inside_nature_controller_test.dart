import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:layouts/app/modules/inside_nature/inside_nature_controller.dart';
import 'package:layouts/app/modules/inside_nature/inside_nature_module.dart';

void main() {
  initModule(InsideNatureModule());
  InsideNatureController insidenature;

  setUp(() {
    insidenature = InsideNatureModule.to.get<InsideNatureController>();
  });

  group('InsideNatureController Test', () {
    test("First Test", () {
      expect(insidenature, isInstanceOf<InsideNatureController>());
    });

    test("Set Value", () {
      expect(insidenature.value, equals(0));
      insidenature.increment();
      expect(insidenature.value, equals(1));
    });
  });
}

import 'package:layouts/app/modules/inside_nature/inside_nature_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:layouts/app/modules/inside_nature/inside_nature_page.dart';
import 'package:layouts/app/modules/inside_nature/models/nature_model.dart';
import 'package:layouts/app/modules/inside_nature/pages/home_page.dart';

import 'models/category_model.dart';

class InsideNatureModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => InsideNatureController()),
        Bind((i) => NatureModel()),
        Bind((i) => CategoryModel()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => InsideNaturePage()),
        Router('/nature', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<InsideNatureModule>.of();
}

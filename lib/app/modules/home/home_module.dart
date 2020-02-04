import 'package:layouts/app/modules/adoption/adoption_module.dart';
import 'package:layouts/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:layouts/app/modules/home/home_page.dart';
import 'package:layouts/app/modules/inside_nature/inside_nature_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/adoption', module: AdoptionModule()),
        Router('/inside_nature', module: InsideNatureModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

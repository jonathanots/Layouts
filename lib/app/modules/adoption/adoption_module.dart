import 'package:layouts/app/modules/adoption/adoption_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:layouts/app/modules/adoption/adoption_page.dart';
import 'package:layouts/app/modules/adoption/pages/details_pet_page.dart';

class AdoptionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AdoptionController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AdoptionPage()),
        Router('/details/:index/:name/:breed/:gender/:age/:distance',
            child: (_, args) => DetailsPetPage(
                index: args.params["index"],
                name: args.params["name"],
                breed: args.params["breed"],
                gender: args.params["gender"],
                age: args.params["age"],
                distance: args.params["distance"])),
      ];

  static Inject get to => Inject<AdoptionModule>.of();
}

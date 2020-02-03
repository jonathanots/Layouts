import 'package:mobx/mobx.dart';

import 'models/animal_model.dart';

part 'adoption_controller.g.dart';

class AdoptionController = _AdoptionBase with _$AdoptionController;

abstract class _AdoptionBase with Store {
  @observable
  List<AnimalModel> listAnimals = [
    AnimalModel(
        name: "Sophie",
        age: 1,
        breed: "Abyssinian Cat",
        distance: 5.2,
        gender: true),
    AnimalModel(
        name: "Rex", age: 2, breed: "Rare Cat", distance: 27.8, gender: false),
    AnimalModel(
        name: "Sax", age: 1, breed: "Comum Cat", distance: 2.5, gender: true),
    AnimalModel(
        name: "Teo",
        age: 3,
        breed: "Super Rare Cat",
        distance: 153.2,
        gender: false),
    AnimalModel(
        name: "Alvin",
        age: 5,
        breed: "Obsidian Cat",
        distance: 9.4,
        gender: false),
  ];
}

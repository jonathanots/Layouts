// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adoption_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdoptionController on _AdoptionBase, Store {
  final _$listAnimalsAtom = Atom(name: '_AdoptionBase.listAnimals');

  @override
  List<AnimalModel> get listAnimals {
    _$listAnimalsAtom.context.enforceReadPolicy(_$listAnimalsAtom);
    _$listAnimalsAtom.reportObserved();
    return super.listAnimals;
  }

  @override
  set listAnimals(List<AnimalModel> value) {
    _$listAnimalsAtom.context.conditionallyRunInAction(() {
      super.listAnimals = value;
      _$listAnimalsAtom.reportChanged();
    }, _$listAnimalsAtom, name: '${_$listAnimalsAtom.name}_set');
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inside_nature_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InsideNatureController on _InsideNatureBase, Store {
  final _$listNatureAtom = Atom(name: '_InsideNatureBase.listNature');

  @override
  List<NatureModel> get listNature {
    _$listNatureAtom.context.enforceReadPolicy(_$listNatureAtom);
    _$listNatureAtom.reportObserved();
    return super.listNature;
  }

  @override
  set listNature(List<NatureModel> value) {
    _$listNatureAtom.context.conditionallyRunInAction(() {
      super.listNature = value;
      _$listNatureAtom.reportChanged();
    }, _$listNatureAtom, name: '${_$listNatureAtom.name}_set');
  }

  final _$listFiltersAtom = Atom(name: '_InsideNatureBase.listFilters');

  @override
  ObservableList<CategoryModel> get listFilters {
    _$listFiltersAtom.context.enforceReadPolicy(_$listFiltersAtom);
    _$listFiltersAtom.reportObserved();
    return super.listFilters;
  }

  @override
  set listFilters(ObservableList<CategoryModel> value) {
    _$listFiltersAtom.context.conditionallyRunInAction(() {
      super.listFilters = value;
      _$listFiltersAtom.reportChanged();
    }, _$listFiltersAtom, name: '${_$listFiltersAtom.name}_set');
  }

  final _$_InsideNatureBaseActionController =
      ActionController(name: '_InsideNatureBase');

  @override
  void changeLike({int index}) {
    final _$actionInfo = _$_InsideNatureBaseActionController.startAction();
    try {
      return super.changeLike(index: index);
    } finally {
      _$_InsideNatureBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFilter(String value) {
    final _$actionInfo = _$_InsideNatureBaseActionController.startAction();
    try {
      return super.addFilter(value);
    } finally {
      _$_InsideNatureBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromFilter(CategoryModel category) {
    final _$actionInfo = _$_InsideNatureBaseActionController.startAction();
    try {
      return super.removeFromFilter(category);
    } finally {
      _$_InsideNatureBaseActionController.endAction(_$actionInfo);
    }
  }
}

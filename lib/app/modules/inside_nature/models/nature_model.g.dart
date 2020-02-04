// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nature_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NatureModel on _NatureModelBase, Store {
  final _$nameAtom = Atom(name: '_NatureModelBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$priceAtom = Atom(name: '_NatureModelBase.price');

  @override
  double get price {
    _$priceAtom.context.enforceReadPolicy(_$priceAtom);
    _$priceAtom.reportObserved();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.context.conditionallyRunInAction(() {
      super.price = value;
      _$priceAtom.reportChanged();
    }, _$priceAtom, name: '${_$priceAtom.name}_set');
  }

  final _$discountAtom = Atom(name: '_NatureModelBase.discount');

  @override
  int get discount {
    _$discountAtom.context.enforceReadPolicy(_$discountAtom);
    _$discountAtom.reportObserved();
    return super.discount;
  }

  @override
  set discount(int value) {
    _$discountAtom.context.conditionallyRunInAction(() {
      super.discount = value;
      _$discountAtom.reportChanged();
    }, _$discountAtom, name: '${_$discountAtom.name}_set');
  }

  final _$likeAtom = Atom(name: '_NatureModelBase.like');

  @override
  bool get like {
    _$likeAtom.context.enforceReadPolicy(_$likeAtom);
    _$likeAtom.reportObserved();
    return super.like;
  }

  @override
  set like(bool value) {
    _$likeAtom.context.conditionallyRunInAction(() {
      super.like = value;
      _$likeAtom.reportChanged();
    }, _$likeAtom, name: '${_$likeAtom.name}_set');
  }

  final _$_NatureModelBaseActionController =
      ActionController(name: '_NatureModelBase');

  @override
  dynamic changeLike() {
    final _$actionInfo = _$_NatureModelBaseActionController.startAction();
    try {
      return super.changeLike();
    } finally {
      _$_NatureModelBaseActionController.endAction(_$actionInfo);
    }
  }
}

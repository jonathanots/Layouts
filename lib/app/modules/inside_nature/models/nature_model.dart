import 'package:mobx/mobx.dart';
part 'nature_model.g.dart';

class NatureModel = _NatureModelBase with _$NatureModel;

abstract class _NatureModelBase with Store {
  @observable
  String name;

  @observable
  double price;

  @observable
  int discount;

  @observable
  bool like;

  _NatureModelBase({
    this.name,
    this.price,
    this.discount,
    this.like = false,
  });

  @action
  changeLike() => like = !like;
}

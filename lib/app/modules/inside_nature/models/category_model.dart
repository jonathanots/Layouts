import 'package:mobx/mobx.dart';
part 'category_model.g.dart';

class CategoryModel = _CategoryModelBase with _$CategoryModel;

abstract class _CategoryModelBase with Store {
  @observable
  String name;

  _CategoryModelBase({
    this.name,
  });
}

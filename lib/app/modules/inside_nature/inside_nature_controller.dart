import 'package:layouts/app/modules/inside_nature/models/category_model.dart';
import 'package:layouts/app/modules/inside_nature/models/nature_model.dart';
import 'package:mobx/mobx.dart';

part 'inside_nature_controller.g.dart';

class InsideNatureController = _InsideNatureBase with _$InsideNatureController;

abstract class _InsideNatureBase with Store {
  @observable
  List<NatureModel> listNature = [
    NatureModel(name: "Flower Bouquet", discount: 30, price: 27.50),
    NatureModel(name: "Floral Cut Design", discount: 40, price: 33.50),
    NatureModel(name: "Vase of Flowers", discount: 15, price: 42.50),
    NatureModel(name: "Flower Bouquet", discount: 30, price: 27.50),
    NatureModel(name: "Floral Cut Design", discount: 40, price: 33.50),
    NatureModel(name: "Vase of Flowers", discount: 15, price: 42.50),
    NatureModel(name: "Flower Bouquet", discount: 30, price: 27.50),
    NatureModel(name: "Floral Cut Design", discount: 40, price: 33.50),
    NatureModel(name: "Vase of Flowers", discount: 15, price: 42.50),
  ];

  @observable
  ObservableList<CategoryModel> listFilters = [
    CategoryModel(name: "green"),
    CategoryModel(name: "wheat")
  ].asObservable();

  @action
  void changeLike({int index}) {
    listNature[index].changeLike();
  }

  @action
  void addFilter(String value) => listFilters.add(CategoryModel(name: value));

  @action
  void removeFromFilter(CategoryModel category) =>
      listFilters.removeWhere((element) => element.name == category.name);
}

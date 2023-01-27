// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import '../models/category.dart';
import '../repositories/category_repository.dart';
part 'category_store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  _CategoryStoreBase() {
    _loadCategories();
  }

  @observable
  String? error;

  ObservableList<Category> categoryList = ObservableList<Category>();

  @computed
  List<Category> get allCategoryList => List.from(categoryList)
    ..insert(0, Category(id: '*', description: 'Todas'));

  @action
  void setCategories(List<Category> categories) {
    categoryList.clear();
    categoryList.addAll(categories);
  }

  @action
  void setError(String value) {
    error = value;
  }

  Future<void> _loadCategories() async {
    try {
      final categories = await CategoryRepository().getList();
      setCategories(categories);
    } catch (e) {
      setError('Parse error: $e');
      rethrow;
    }
  }
}

// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/category.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStoreBase with _$CreateStore;

abstract class _CreateStoreBase with Store {
  ObservableList images = ObservableList();

  @observable
  Category? category;

  @action
  void clearCategory() => category = null;

  @action
  void setCategory(Category value) => category = value;
}

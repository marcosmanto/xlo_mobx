// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/category.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStoreBase with _$CreateStore;

abstract class _CreateStoreBase with Store {
  ObservableList images = ObservableList();

  @observable
  String? description;
  @action
  setDescription(String? value) => description = value;

  @observable
  Category? category;

  @observable
  bool hidePhone = false;
  @action
  void setHidePhone(bool value) => hidePhone = value;

  @observable
  String title = '';
  @action
  void setTitle(String value) => title = value;

  @action
  void clearCategory() => category = null;

  @action
  void setCategory(Category value) => category = value;

  @computed
  bool get descriptionValid => description != null && description!.length >= 15;
  String? get descriptionError {
    if (descriptionValid) {
      return null;
    } else if (description!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Descrição muito curta';
    }
  }

  @computed
  bool get titleValid => title.length >= 6;
  String? get titleError {
    if (titleValid) {
      return null;
    } else if (title.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Título muito curto';
    }
  }

  @computed
  bool get imagesValid => images.isNotEmpty;
  String? get imagesError {
    if (imagesValid) {
      return null;
    } else {
      return 'Insira imagens';
    }
  }
}

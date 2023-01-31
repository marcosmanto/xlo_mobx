// ignore_for_file: library_private_types_in_public_api

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/repositories/ad_repository.dart';
import 'package:xlo_mobx/stores/cep_store.dart';
import 'package:xlo_mobx/stores/user_manager_store.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStoreBase with _$CreateStore;

abstract class _CreateStoreBase with Store {
  ObservableList images = ObservableList();

  @observable
  bool loading = false;

  @observable
  String? description;
  @action
  setDescription(String? value) => description = value;

  @observable
  Category? category;

  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  @observable
  bool hidePhone = false;
  @action
  void setHidePhone(bool value) => hidePhone = value;

  @observable
  String? priceText;
  @action
  setPrice(String? value) => priceText = value;

  @computed
  bool get formValid =>
      imagesValid &&
      titleValid &&
      descriptionValid &&
      categoryValid &&
      addressValid &&
      priceValid;

  @computed
  get sendPressed => !loading && formValid ? _send : null;

  @observable
  String? error;

  @action
  Future _send() async {
    error = null;
    loading = true;
    final ad = Ad(
      title: title,
      description: description!,
      category: category!,
      price: price!,
      hidePhone: hidePhone,
      images: images,
      address: address!,
      user: GetIt.I<UserManagerStore>().user,
    );

    try {
      final response = await AdRepository().save(ad);
      error = null;
    } catch (e) {
      error = e.toString();
    }
    loading = false;
  }

  @computed
  double? get price {
    var num = double.tryParse(priceText?.replaceAll(RegExp(r'\D'), '') ?? '');
    if (num != null && num != 0) {
      return num / 100;
    }
    return null;
  }

  bool get priceValid => price != null && price! <= 9999999;
  String? get priceError {
    if (!showErrors || priceValid) {
      return null;
    } else if (priceText != null && priceText!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Preço inválido';
    }
  }

  @observable
  String title = '';
  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 6;
  @computed
  String? get titleError {
    if (!showErrors || titleValid) {
      return null;
    } else if (title.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Título muito curto';
    }
  }

  @action
  void clearCategory() => category = null;

  @action
  void setCategory(Category value) => category = value;

  CepStore cepStore = CepStore();

  @computed
  Address? get address => cepStore.address;
  bool get addressValid => address != null;
  String? get addressError {
    if (!showErrors || addressValid) {
      return null;
    } else {
      return 'Campo obrigatório';
    }
  }

  @computed
  bool get categoryValid => category != null;
  String? get categoryError {
    if (!showErrors || categoryValid) {
      return null;
    } else {
      return 'Campo obrigatório';
    }
  }

  @computed
  bool get descriptionValid => description != null && description!.length >= 15;
  String? get descriptionError {
    if (!showErrors || descriptionValid) {
      return null;
    } else if (description == null || description!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Descrição muito curta';
    }
  }

  @computed
  bool get imagesValid => images.isNotEmpty;
  String? get imagesError {
    if (!showErrors || imagesValid) {
      return null;
    } else {
      return 'Insira imagens';
    }
  }
}

// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'filter_store.g.dart';

class FilterStore = _FilterStoreBase with _$FilterStore;

enum OrderBy { date, price }

const vendorTypeParticular = 1 << 0;
const vendorTypeProfessional = 1 << 1;

abstract class _FilterStoreBase with Store {
  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = false;

  @observable
  bool form_valid = false;

  @computed
  bool get formValid => form_valid;

  @computed
  get sendPressed => !loading && formValid ? _send : null;

  @action
  Future _send() async {
    error = null;
    loading = true;
    await Future.delayed(Duration(seconds: 5));
    loading = false;
  }

  @observable
  OrderBy orderBy = OrderBy.date;

  @action
  void setOrderBy(OrderBy value) => orderBy = value;

  @observable
  int? minPrice;
  @action
  setMinPrice(int? value) => minPrice = value;

  @observable
  int? maxPrice;
  @action
  setMaxPrice(int? value) => maxPrice = value;

  @computed
  String? get priceError =>
      maxPrice != null && minPrice != null && maxPrice! < minPrice!
          ? 'Faixa de preço inválida'
          : null;

  @observable
  int vendorType = vendorTypeParticular;

  @action
  void selectVendorType(int value) => vendorType = value;
  void setVendorType(int type) => vendorType = vendorType | type;
  void resetVendorType(int type) => vendorType = vendorType & ~type;

  @computed
  bool get isTypeParticular => (vendorType & vendorTypeParticular) != 0;
  bool get isTypeProfessional => (vendorType & vendorTypeProfessional) != 0;
}

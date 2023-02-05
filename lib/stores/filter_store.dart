// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/stores/home_store.dart';
part 'filter_store.g.dart';

class FilterStore = _FilterStoreBase with _$FilterStore;

enum OrderBy { date, price }

const vendorTypeParticular = 1 << 0;
const vendorTypeProfessional = 1 << 1;

abstract class _FilterStoreBase with Store {
  _FilterStoreBase({
    this.orderBy = OrderBy.date,
    this.minPrice,
    this.maxPrice,
    this.vendorType = 0,
  });

  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  bool showErrors = false;

  @observable
  bool filterApplied = false;
  @action
  void setFilterApplied(bool value) => filterApplied = value;

  @action
  void invalidSendPressed() => showErrors = true;

  @computed
  bool get formValid => isPriceRangeValid && isVendorValid;

  @computed
  get sendPressed => !loading && formValid ? _send : null;

  @action
  Future _send() async {
    error = null;
    loading = true;
    showErrors = true;
    if (formValid) {
      GetIt.I<HomeStore>().setFilter(this as FilterStore);
      filterApplied = true;
    }
    loading = false;
  }

  @observable
  OrderBy orderBy;

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
  String? get priceError {
    if (!showErrors) return null;
    return maxPrice != null && minPrice != null && maxPrice! < minPrice!
        ? 'Faixa de preço inválida'
        : null;
  }

  bool get isPriceRangeValid => priceError == null;

  @observable
  int vendorType;

  @computed
  bool get isVendorValid => vendorType > 0;

  @computed
  String? get vendorError {
    if (!showErrors) return null;
    if (!isVendorValid) return 'Selecione ao menos um tipo de anunciante';
    return null;
  }

  @action
  void selectVendorType(int value) => vendorType = value;
  void setVendorType(int type) => vendorType = vendorType | type;
  void resetVendorType(int type) => vendorType = vendorType & ~type;

  @computed
  bool get isTypeParticular => (vendorType & vendorTypeParticular) != 0;
  bool get isTypeProfessional => (vendorType & vendorTypeProfessional) != 0;

  FilterStore clone() {
    return FilterStore(
      orderBy: orderBy,
      minPrice: minPrice,
      maxPrice: maxPrice,
      vendorType: vendorType,
    );
  }
}

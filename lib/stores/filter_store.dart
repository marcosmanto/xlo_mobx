// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'filter_store.g.dart';

class FilterStore = _FilterStoreBase with _$FilterStore;

enum OrderBy { date, price }

abstract class _FilterStoreBase with Store {
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
}

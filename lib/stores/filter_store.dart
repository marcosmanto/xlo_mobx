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
}

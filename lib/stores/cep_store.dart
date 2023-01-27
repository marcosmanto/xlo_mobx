// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/repositories/cep_repository.dart';
part 'cep_store.g.dart';

class CepStore = _CepStoreBase with _$CepStore;

abstract class _CepStoreBase with Store {
  _CepStoreBase() {
    autorun((_) {
      if (clearCep.length != 8) {
        _reset();
      } else {
        _searchCep();
      }
    });
  }

  void _reset() {
    address = null;
    error = null;
  }

  @action
  Future<void> _searchCep() async {
    loading = true;
    try {
      address = await CepRepository().getAddressFromApi(clearCep);
      error = null;
    } catch (e) {
      error = e.toString();
      address = null;
    }
    loading = false;
  }

  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  Address? address;

  @observable
  String? cep;

  @action
  void setCep(String value) => cep = value;

  @computed
  String get clearCep {
    return cep != null ? cep!.replaceAll(RegExp(r'\D'), '') : '';
  }
}

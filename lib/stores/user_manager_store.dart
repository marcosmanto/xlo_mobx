// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import '../repositories/user_repository.dart';
import '../models/user.dart';
part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStoreBase with _$UserManagerStore;

abstract class _UserManagerStoreBase with Store {
  _UserManagerStoreBase() {
    _getCurrentUser();
  }

  @observable
  User? user;
  @action
  setUser(User? value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  @action
  Future<void> logout() async {
    await UserRepository().logout();
    user = null;
  }

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().currentUser();
    setUser(user);
  }
}

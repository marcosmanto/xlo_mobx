import 'package:mobx/mobx.dart';
import '../models/user.dart';
part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStoreBase with _$UserManagerStore;

abstract class _UserManagerStoreBase with Store {
  @observable
  User? user;
  @action
  setUser(User value) => user = value;
  @action
  clearUser() => user = null;

  @computed
  bool get isLoggedIn => user != null;
}

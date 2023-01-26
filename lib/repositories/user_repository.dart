import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../models/user.dart';
import 'parse_errors.dart';
import 'table_keys.dart';

class UserRepository {
  Future<User> signUp(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set<int>(keyUserType, user.type.index);

    final response = await parseUser.signUp();

    if (response.success) {
      return userfromParse(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<User> loginWithEmail(String email, String password) async {
    final parseUser = ParseUser(email, password, null);

    final response = await parseUser.login();

    if (response.success) {
      return userfromParse(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<User?> currentUser() async {
    final parseUser = await ParseUser.currentUser();
    if (parseUser != null) {
      final response =
          await ParseUser.getCurrentUserFromServer(parseUser.sessionToken!);
      if (response?.success ?? false) {
        return userfromParse(response!.result);
      } else {
        await parseUser.logout();
      }
    }
    return null;
  }

  Future<void> logout() async {
    final parseUser = await ParseUser.currentUser();
    if (parseUser != null) {
      await parseUser.logout();
    }
  }

  User userfromParse(ParseUser user) {
    return User(
      id: user.get(keyUserId),
      name: user.get(keyUserName),
      email: user.get(keyUserEmail),
      phone: user.get(keyUserPhone),
      type: UserType.values[user.get(keyUserType)],
      createdAt: user.get(keyUserCreatedAt),
    );
  }
}

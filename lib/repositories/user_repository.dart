import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/repositories/parse_errors.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';

import '../models/user.dart';

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

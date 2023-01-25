// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:xlo_mobx/repositories/table_keys.dart';

enum UserType { particular, professional }

class User {
  User({
    required this.name,
    required this.email,
    required this.phone,
    this.id,
    this.password,
    this.type = UserType.particular,
    this.createdAt,
  });

  String? id;
  String email;
  String name;
  String? password;
  String phone;
  UserType type;
  DateTime? createdAt;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      keyUserId: id,
      keyUserName: name,
      keyUserEmail: email,
      keyUserPhone: phone,
      keyUserType: type.index
    };
  }

  /*factory User.fromParse(ParseUser user) {
    return User(
      id: user.get(keyUserId),
      name: user.get(keyUserName),
      email: user.get(keyUserEmail),
      phone: user.get(keyUserPhone),
      type: UserType.values[user.get(keyUserType)],
      createdAt: user.get(keyUserCreatedAt),
    );
  }*/

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map[keyUserId],
      name: map[keyUserName] as String,
      email: map[keyUserEmail] as String,
      phone: map[keyUserPhone] as String,
      type: map[keyUserType] as int == 0
          ? UserType.particular
          : UserType.professional,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, password: $password, phone: $phone, createdAt: $createdAt)';
  }
}

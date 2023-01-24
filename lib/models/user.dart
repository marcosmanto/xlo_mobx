enum UserType { particular, professional }

class User {
  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.type = UserType.particular,
  });

  String email;
  String name;
  String password;
  String phone;
  UserType type;
}

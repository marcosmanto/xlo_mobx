import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../helpers/extensions.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String? email;

  @observable
  String? error;

  @observable
  bool loading = false;

  @observable
  String? name;

  @observable
  String? password;

  @action
  setEmail(String? value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();

  String? get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'E-mail inválido';
    }
  }

  @action
  setPassword(String? value) => password = value;

  @computed
  bool get passwordValid =>
      password != null &&
      RegExp(r'^(?=.{6,})(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=.*\d).+$')
          .hasMatch(password!);

  String? get passwordError {
    if (password == null || passwordValid) {
      return null;
    } else if (password!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senha inválida';
    }
  }

  @computed
  bool get isFormValid => emailValid && passwordValid;

  @computed
  dynamic get loginPressed => isFormValid && !loading ? _login : null;

  @computed
  Color? get textColor => loading ? Colors.grey : null;

  @action
  clearError() => error = null;

  @action
  Future<void> _login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 4));

    loading = false;
  }
}

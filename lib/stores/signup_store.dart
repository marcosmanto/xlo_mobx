import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../helpers/extensions.dart';
import '../models/user.dart';
import '../repositories/user_repository.dart';
import 'user_manager_store.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  @observable
  String? email;

  @observable
  String? error;

  @observable
  bool loading = false;

  @observable
  String? name;

  @observable
  String? pass1;

  @observable
  String? pass2;

  @observable
  String? phone;

  @action
  setname(String value) => name = value.trim();

  @computed
  bool get nameValid => name != null && name!.length > 6;

  String? get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

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
  setPhone(String? value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone!.length >= 14;

  String? get phoneError {
    if (phone == null || phoneValid) {
      return null;
    } else if (phone!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Celular inválido';
    }
  }

  @action
  setPass1(String? value) => pass1 = value;

  @computed
  bool get pass1Valid =>
      pass1 != null &&
      RegExp(r'^(?=.{6,})(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=.*\d).+$')
          .hasMatch(pass1!);

  String? get pass1Error {
    if (pass1 == null || pass1Valid) {
      return null;
    } else if (pass1!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senha inválida';
    }
  }

  @action
  setPass2(String? value) => pass2 = value;

  @computed
  bool get pass2Valid => pass2 != null && pass2 == pass1;

  String? get pass2Error {
    if (pass2 == null || pass2Valid) {
      return null;
    } else if (pass2!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senhas não coincidem';
    }
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && phoneValid && pass1Valid && pass2Valid;

  @computed
  dynamic get signUpPressed => isFormValid && !loading ? _signUp : null;

  @computed
  Color? get textColor => loading ? Colors.grey : null;

  @action
  clearError() => error = null;

  /*_SignupStoreBase() {
    autorun((_) {
      // ignore: avoid_print
      print('pass1: $pass1');
      // ignore: avoid_print
      print('pass2: $pass2');
      // ignore: avoid_print
      print('isFormValid: $isFormValid');
    });
  }*/

  @action
  Future<void> _signUp() async {
    loading = true;

    clearError();

    final user = User(
      name: name!,
      email: email!,
      phone: phone!,
      password: pass1!,
    );

    try {
      final resultUser = await UserRepository().signUp(user);
      GetIt.I<UserManagerStore>().setUser(resultUser);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }
}

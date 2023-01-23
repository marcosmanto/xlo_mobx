import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extensions.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  _SignupStoreBase() {
    autorun((_) {
      // ignore: avoid_print
      print('pass1: $pass1');
      // ignore: avoid_print
      print('pass2: $pass2');
    });
  }

  @observable
  String? name;

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

  @observable
  String? email;
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

  @observable
  String? phone;
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

  @observable
  String? pass1;
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

  @observable
  String? pass2;
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
  void Function()? get signUpPressed => isFormValid ? _signUp : null;

  @observable
  bool? loading;

  @action
  Future<void> _signUp() async {
    loading = true;

    await Future.delayed(Duration(seconds: 3));

    loading = false;
  }
}

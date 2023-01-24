// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupStore on _SignupStoreBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_SignupStoreBase.nameValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SignupStoreBase.emailValid'))
          .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_SignupStoreBase.phoneValid'))
          .value;
  Computed<bool>? _$pass1ValidComputed;

  @override
  bool get pass1Valid =>
      (_$pass1ValidComputed ??= Computed<bool>(() => super.pass1Valid,
              name: '_SignupStoreBase.pass1Valid'))
          .value;
  Computed<bool>? _$pass2ValidComputed;

  @override
  bool get pass2Valid =>
      (_$pass2ValidComputed ??= Computed<bool>(() => super.pass2Valid,
              name: '_SignupStoreBase.pass2Valid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignupStoreBase.isFormValid'))
          .value;
  Computed<dynamic>? _$signUpPressedComputed;

  @override
  dynamic get signUpPressed =>
      (_$signUpPressedComputed ??= Computed<dynamic>(() => super.signUpPressed,
              name: '_SignupStoreBase.signUpPressed'))
          .value;
  Computed<Color?>? _$textColorComputed;

  @override
  Color? get textColor =>
      (_$textColorComputed ??= Computed<Color?>(() => super.textColor,
              name: '_SignupStoreBase.textColor'))
          .value;

  late final _$emailAtom =
      Atom(name: '_SignupStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_SignupStoreBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_SignupStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$nameAtom = Atom(name: '_SignupStoreBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$pass1Atom =
      Atom(name: '_SignupStoreBase.pass1', context: context);

  @override
  String? get pass1 {
    _$pass1Atom.reportRead();
    return super.pass1;
  }

  @override
  set pass1(String? value) {
    _$pass1Atom.reportWrite(value, super.pass1, () {
      super.pass1 = value;
    });
  }

  late final _$pass2Atom =
      Atom(name: '_SignupStoreBase.pass2', context: context);

  @override
  String? get pass2 {
    _$pass2Atom.reportRead();
    return super.pass2;
  }

  @override
  set pass2(String? value) {
    _$pass2Atom.reportWrite(value, super.pass2, () {
      super.pass2 = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: '_SignupStoreBase.phone', context: context);

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$_signUpAsyncAction =
      AsyncAction('_SignupStoreBase._signUp', context: context);

  @override
  Future<void> _signUp() {
    return _$_signUpAsyncAction.run(() => super._signUp());
  }

  late final _$_SignupStoreBaseActionController =
      ActionController(name: '_SignupStoreBase', context: context);

  @override
  dynamic setname(String value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
        name: '_SignupStoreBase.setname');
    try {
      return super.setname(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String? value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
        name: '_SignupStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhone(String? value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
        name: '_SignupStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPass1(String? value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
        name: '_SignupStoreBase.setPass1');
    try {
      return super.setPass1(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPass2(String? value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
        name: '_SignupStoreBase.setPass2');
    try {
      return super.setPass2(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearError() {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
        name: '_SignupStoreBase.clearError');
    try {
      return super.clearError();
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
error: ${error},
loading: ${loading},
name: ${name},
pass1: ${pass1},
pass2: ${pass2},
phone: ${phone},
nameValid: ${nameValid},
emailValid: ${emailValid},
phoneValid: ${phoneValid},
pass1Valid: ${pass1Valid},
pass2Valid: ${pass2Valid},
isFormValid: ${isFormValid},
signUpPressed: ${signUpPressed},
textColor: ${textColor}
    ''';
  }
}

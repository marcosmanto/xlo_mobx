// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FilterStore on _FilterStoreBase, Store {
  Computed<bool>? _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_FilterStoreBase.formValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: '_FilterStoreBase.sendPressed'))
          .value;
  Computed<String?>? _$priceErrorComputed;

  @override
  String? get priceError =>
      (_$priceErrorComputed ??= Computed<String?>(() => super.priceError,
              name: '_FilterStoreBase.priceError'))
          .value;
  Computed<bool>? _$isTypeParticularComputed;

  @override
  bool get isTypeParticular => (_$isTypeParticularComputed ??= Computed<bool>(
          () => super.isTypeParticular,
          name: '_FilterStoreBase.isTypeParticular'))
      .value;

  late final _$loadingAtom =
      Atom(name: '_FilterStoreBase.loading', context: context);

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

  late final _$errorAtom =
      Atom(name: '_FilterStoreBase.error', context: context);

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

  late final _$showErrorsAtom =
      Atom(name: '_FilterStoreBase.showErrors', context: context);

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  late final _$form_validAtom =
      Atom(name: '_FilterStoreBase.form_valid', context: context);

  @override
  bool get form_valid {
    _$form_validAtom.reportRead();
    return super.form_valid;
  }

  @override
  set form_valid(bool value) {
    _$form_validAtom.reportWrite(value, super.form_valid, () {
      super.form_valid = value;
    });
  }

  late final _$orderByAtom =
      Atom(name: '_FilterStoreBase.orderBy', context: context);

  @override
  OrderBy get orderBy {
    _$orderByAtom.reportRead();
    return super.orderBy;
  }

  @override
  set orderBy(OrderBy value) {
    _$orderByAtom.reportWrite(value, super.orderBy, () {
      super.orderBy = value;
    });
  }

  late final _$minPriceAtom =
      Atom(name: '_FilterStoreBase.minPrice', context: context);

  @override
  int? get minPrice {
    _$minPriceAtom.reportRead();
    return super.minPrice;
  }

  @override
  set minPrice(int? value) {
    _$minPriceAtom.reportWrite(value, super.minPrice, () {
      super.minPrice = value;
    });
  }

  late final _$maxPriceAtom =
      Atom(name: '_FilterStoreBase.maxPrice', context: context);

  @override
  int? get maxPrice {
    _$maxPriceAtom.reportRead();
    return super.maxPrice;
  }

  @override
  set maxPrice(int? value) {
    _$maxPriceAtom.reportWrite(value, super.maxPrice, () {
      super.maxPrice = value;
    });
  }

  late final _$vendorTypeAtom =
      Atom(name: '_FilterStoreBase.vendorType', context: context);

  @override
  int get vendorType {
    _$vendorTypeAtom.reportRead();
    return super.vendorType;
  }

  @override
  set vendorType(int value) {
    _$vendorTypeAtom.reportWrite(value, super.vendorType, () {
      super.vendorType = value;
    });
  }

  late final _$_sendAsyncAction =
      AsyncAction('_FilterStoreBase._send', context: context);

  @override
  Future<dynamic> _send() {
    return _$_sendAsyncAction.run(() => super._send());
  }

  late final _$_FilterStoreBaseActionController =
      ActionController(name: '_FilterStoreBase', context: context);

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderBy(OrderBy value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.setOrderBy');
    try {
      return super.setOrderBy(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMinPrice(int? value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.setMinPrice');
    try {
      return super.setMinPrice(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMaxPrice(int? value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.setMaxPrice');
    try {
      return super.setMaxPrice(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectVendorType(int value) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.selectVendorType');
    try {
      return super.selectVendorType(value);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
showErrors: ${showErrors},
form_valid: ${form_valid},
orderBy: ${orderBy},
minPrice: ${minPrice},
maxPrice: ${maxPrice},
vendorType: ${vendorType},
formValid: ${formValid},
sendPressed: ${sendPressed},
priceError: ${priceError},
isTypeParticular: ${isTypeParticular}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on _UserController, Store {
  late final _$emailAtom =
      Atom(name: '_UserController.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_UserController.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$nameAtom = Atom(name: '_UserController.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$getNameAsyncAction =
      AsyncAction('_UserController.getName', context: context);

  @override
  Future<void> getName() {
    return _$getNameAsyncAction.run(() => super.getName());
  }

  late final _$_UserControllerActionController =
      ActionController(name: '_UserController', context: context);

  @override
  void authenticate(String email, String password) {
    final _$actionInfo = _$_UserControllerActionController.startAction(
        name: '_UserController.authenticate');
    try {
      return super.authenticate(email, password);
    } finally {
      _$_UserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isAuthenticated(String email, String password) {
    final _$actionInfo = _$_UserControllerActionController.startAction(
        name: '_UserController.isAuthenticated');
    try {
      return super.isAuthenticated(email, password);
    } finally {
      _$_UserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
name: ${name}
    ''';
  }
}

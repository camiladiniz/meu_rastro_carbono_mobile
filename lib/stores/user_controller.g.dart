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

  late final _$registerDateAtom =
      Atom(name: '_UserController.registerDate', context: context);

  @override
  String get registerDate {
    _$registerDateAtom.reportRead();
    return super.registerDate;
  }

  @override
  set registerDate(String value) {
    _$registerDateAtom.reportWrite(value, super.registerDate, () {
      super.registerDate = value;
    });
  }

  late final _$loginErrorAtom =
      Atom(name: '_UserController.loginError', context: context);

  @override
  String get loginError {
    _$loginErrorAtom.reportRead();
    return super.loginError;
  }

  @override
  set loginError(String value) {
    _$loginErrorAtom.reportWrite(value, super.loginError, () {
      super.loginError = value;
    });
  }

  late final _$rewardsAtom =
      Atom(name: '_UserController.rewards', context: context);

  @override
  List<BadgeModel> get rewards {
    _$rewardsAtom.reportRead();
    return super.rewards;
  }

  @override
  set rewards(List<BadgeModel> value) {
    _$rewardsAtom.reportWrite(value, super.rewards, () {
      super.rewards = value;
    });
  }

  late final _$authenticateAsyncAction =
      AsyncAction('_UserController.authenticate', context: context);

  @override
  Future<String> authenticate(String userEmail, String userPassword) {
    return _$authenticateAsyncAction
        .run(() => super.authenticate(userEmail, userPassword));
  }

  late final _$registerAsyncAction =
      AsyncAction('_UserController.register', context: context);

  @override
  Future<bool> register(
      String userName, String userEmail, String userPassword) {
    return _$registerAsyncAction
        .run(() => super.register(userName, userEmail, userPassword));
  }

  late final _$isAuthenticatedAsyncAction =
      AsyncAction('_UserController.isAuthenticated', context: context);

  @override
  Future<bool> isAuthenticated() {
    return _$isAuthenticatedAsyncAction.run(() => super.isAuthenticated());
  }

  late final _$getNameAsyncAction =
      AsyncAction('_UserController.getName', context: context);

  @override
  Future getName() {
    return _$getNameAsyncAction.run(() => super.getName());
  }

  late final _$cleanErrorAsyncAction =
      AsyncAction('_UserController.cleanError', context: context);

  @override
  Future<void> cleanError() {
    return _$cleanErrorAsyncAction.run(() => super.cleanError());
  }

  late final _$getUserRewardsAsyncAction =
      AsyncAction('_UserController.getUserRewards', context: context);

  @override
  Future<dynamic> getUserRewards() {
    return _$getUserRewardsAsyncAction.run(() => super.getUserRewards());
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
name: ${name},
registerDate: ${registerDate},
loginError: ${loginError},
rewards: ${rewards}
    ''';
  }
}

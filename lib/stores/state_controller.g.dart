// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StateController on _StateController, Store {
  late final _$loadingAtom =
      Atom(name: '_StateController.loading', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_StateController.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$postAsyncAction =
      AsyncAction('_StateController.post', context: context);

  @override
  Future<dynamic> post(Uri endpoint, String token, dynamic body) {
    return _$postAsyncAction.run(() => super.post(endpoint, token, body));
  }

  late final _$_StateControllerActionController =
      ActionController(name: '_StateController', context: context);

  @override
  void startLoading() {
    final _$actionInfo = _$_StateControllerActionController.startAction(
        name: '_StateController.startLoading');
    try {
      return super.startLoading();
    } finally {
      _$_StateControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLoading() {
    final _$actionInfo = _$_StateControllerActionController.startAction(
        name: '_StateController.stopLoading');
    try {
      return super.stopLoading();
    } finally {
      _$_StateControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorMessage(String message) {
    final _$actionInfo = _$_StateControllerActionController.startAction(
        name: '_StateController.setErrorMessage');
    try {
      return super.setErrorMessage(message);
    } finally {
      _$_StateControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _returnResponse(http.Response response) {
    final _$actionInfo = _$_StateControllerActionController.startAction(
        name: '_StateController._returnResponse');
    try {
      return super._returnResponse(response);
    } finally {
      _$_StateControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
errorMessage: ${errorMessage}
    ''';
  }
}

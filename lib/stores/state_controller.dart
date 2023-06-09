import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:meu_rastro_carbono/infra/requests/requests_base_exception.dart';

import '../infra/shared_preference_constants.dart';
import '../infra/shared_preference_service.dart';

part 'state_controller.g.dart';

class StateController = _StateController with _$StateController;

abstract class _StateController extends Disposable with Store {
  final SharedPreferencesService localStorage =
      Modular.get<SharedPreferencesService>();
      
  @observable
  bool loading = false;

  @observable
  String errorMessage = "";

  _StateController() {
    initializeSharedPreferences();
  }

    Future<void> initializeSharedPreferences() async {
    await localStorage.initializeSharedPreferences();
  }

  @override
  void dispose() {}

  @action
  void startLoading() {
    errorMessage = "";
    loading = true;
  }

  @action
  void stopLoading() {
    loading = false;
  }

  @action
  void setErrorMessage(String message) {
    errorMessage = message;
  }

  Future<dynamic> get(Uri endpoint) async {
    var token = await localStorage.getStringValue(SharedPreferenceConstants.token);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var responseJson;
    try {
      var token = await localStorage.getStringValue(SharedPreferenceConstants.token);
      final response = await http.get(endpoint, headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Ops, você está sem conexão com a internet.');
    }
    return responseJson;
  }

  @action
  Future<dynamic> post(Uri endpoint, dynamic body) async {
    startLoading();
    var token = await localStorage.getStringValue(SharedPreferenceConstants.token);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var responseJson;

    var payload;
    if (body != null) {
      payload = json.encode(body);
    }

    try {
      final response =
          await http.post(endpoint, headers: headers, body: payload);
      responseJson = _returnResponse(response);
    } on SocketException {
      stopLoading();
      errorMessage = 'Opa, você está sem conexão com a internet.';
      throw FetchDataException('Opa, você está sem conexão com a internet.');
    } catch (e) {
      stopLoading();
      errorMessage = e.toString();
      return e;
    }

    stopLoading();
    return responseJson;
  }

  @action
  dynamic _returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        var responseJson = response;
        print(responseJson);
        return responseJson;
      case 400:
            errorMessage = response.body.toString();
        throw BadRequestException(
            '${response.statusCode} - ${response.body.toString()}');
      case 401:
      case 403:
        if (response.request?.url.path == '/account/login') {
          throw UnauthorisedException(response.body.toString());
        } else {
          await localStorage.setBoolValue(SharedPreferenceConstants.isAuthenticated, false);
          Modular.to.navigate('/login');
        }

      case 500:
        throw FetchDataException(
            'Ops ocorreu um erro, tente novamente mais tarde!');
      default:
        throw FetchDataException(
            '${response.statusCode} - Ops ocorreu um erro, tente novamente mais tarde!');
    }
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:meu_rastro_carbono/infra/requests/requests_base_exception.dart';

part 'state_controller.g.dart';

class StateController = _StateController with _$StateController;

abstract class _StateController extends Disposable with Store {
  @observable
  bool loading = false;

  @observable
  String errorMessage = "";

  _StateController() {
    // initializeSharedPreferences();
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
    var responseJson;
    try {
      final response = await http.get(endpoint);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Ops, você está sem conexão com a internet.');
    }
    return responseJson;
  }

  @action
  Future<dynamic> post(Uri endpoint, String token, dynamic body) async {
    startLoading();
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
  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response;
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(
            '${response.statusCode} - ${response.body.toString()}');
      case 401:
      case 403:
        if (response.request?.url.path == '/account/login') {
          throw UnauthorisedException(response.body.toString());
        } else {
          throw UnauthorisedException(
              '${response.statusCode} - ${response.body.toString()}');
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

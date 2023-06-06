import 'dart:convert';
import 'dart:io';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:meu_rastro_carbono/infra/requests/requests_base_exception.dart';

import '../../stores/state_controller.dart';

class RequestsBase {
  final StateController stateCtrl = Modular.get<StateController>();

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

  Future<dynamic> post(Uri endpoint, String token, dynamic body) async {
    stateCtrl.startLoading();
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
      throw FetchDataException('Opa, você está sem conexão com a internet.');
    } catch (e) {
      stateCtrl.stopLoading();
      stateCtrl
          .setErrorMessage("Ops, um erro ocorreu, tente novamente mais tarde");
    }

    stateCtrl.stopLoading();
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response;
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Ops ocorreu um erro, tente novamente mais tarde!');
    }
  }
}

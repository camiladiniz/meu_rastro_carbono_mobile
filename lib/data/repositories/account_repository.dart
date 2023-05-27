import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/data/datasources/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:meu_rastro_carbono/domain/user/user_entity.dart';

import '../../domain/user/login_response.dart';
import '../../infra/shared_preference_service.dart';

class AccountRepository {
  final http.Client client;
  final SharedPreferencesService sharedPreferencesService =
      Modular.get<SharedPreferencesService>();

  AccountRepository(this.client);

  Future<LoginResponse> login(UserEntity userEntity) async {
    final headers = {'Content-Type': 'application/json'};

    final response = await client.post(API.authenticate(),
        headers: headers, body: json.encode(userEntity));

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }
}

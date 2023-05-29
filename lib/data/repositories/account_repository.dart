import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/data/datasources/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:meu_rastro_carbono/data/models/evolution/badge_model.dart';
import 'package:meu_rastro_carbono/domain/user/user_entity.dart';

import '../../domain/rewards/user_rewards_response.dart';
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

  Future<bool> register(UserEntity userEntity) async {
    final headers = {'Content-Type': 'application/json'};

    final response = await client.post(API.registerNewUser(),
        headers: headers, body: json.encode(userEntity));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception();
    }
  }

  Future<List<BadgeModel>> getUserRewards(String userId) async {
    final response = await client.post(API.getUserRewards(userId));

    if (response.statusCode == 200) {
      var tips = UserRewardsResponse.fromList(json.decode(response.body));
      return UserRewardsResponse.toBadgeModel(tips);
    } else {
      throw Exception();
    }
  }
}

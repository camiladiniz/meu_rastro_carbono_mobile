import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/data/datasources/endpoints.dart';
import 'package:meu_rastro_carbono/data/models/evolution/badge_model.dart';
import 'package:meu_rastro_carbono/domain/user/user_entity.dart';

import '../../domain/rewards/user_rewards_response.dart';
import '../../domain/user/login_response.dart';
import '../../infra/shared_preference_service.dart';
import '../../stores/state_controller.dart';

class AccountRepository {
  final StateController stateCtrl = Modular.get<StateController>();

  final SharedPreferencesService localStorage =
      Modular.get<SharedPreferencesService>();

  AccountRepository(httpHelper);

  Future<LoginResponse> login(UserEntity userEntity) async {
    final response = await stateCtrl.post(API.authenticate(), userEntity);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

  Future<LoginResponse> register(UserEntity userEntity) async {
    final response =
        await stateCtrl.post(API.registerNewUser(), userEntity);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

  Future<List<BadgeModel>> getUserRewards() async {
    final response = await stateCtrl.post(API.getUserRewards(), null);

    if (response.statusCode == 200) {
      var rewards = UserRewardsResponse.fromList(json.decode(response.body));
      return UserRewardsResponse.toBadgeModel(rewards);
    } else {
      throw Exception();
    }
  }
}

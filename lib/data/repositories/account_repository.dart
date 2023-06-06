import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/data/datasources/endpoints.dart';
import 'package:meu_rastro_carbono/data/models/evolution/badge_model.dart';
import 'package:meu_rastro_carbono/domain/user/user_entity.dart';

import '../../domain/rewards/user_rewards_response.dart';
import '../../domain/user/login_response.dart';
import '../../infra/shared_preference_constants.dart';
import '../../infra/shared_preference_service.dart';
import '../../stores/state_controller.dart';

class AccountRepository {
  final StateController stateCtrl = Modular.get<StateController>();

  final SharedPreferencesService localStorage =
      Modular.get<SharedPreferencesService>();

  AccountRepository(httpHelper);

  Future<LoginResponse> login(UserEntity userEntity) async {
    final response = await stateCtrl.post(API.authenticate(), "", userEntity);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

  Future<LoginResponse> register(UserEntity userEntity) async {
    final response =
        await stateCtrl.post(API.registerNewUser(), "", userEntity);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

  // Future<List<BadgeModel>> getUserRewards(String userId) async {
  // var token = await localStorage.getStringValue(SharedPreferenceConstants.token);
  //   // final response = await client.post(API.getUserRewards(userId));

  //   // if (response.statusCode == 200) {
  //   //   var tips = UserRewardsResponse.fromList(json.decode(response.body));
  //   //   return UserRewardsResponse.toBadgeModel(tips);
  //   // } else {
  //   //   throw Exception();
  //   // }
  //   var list = List<BadgeModel>;
  //   await Future.delayed(const Duration(seconds: 1), (){});
  //   return list;
  // }
}

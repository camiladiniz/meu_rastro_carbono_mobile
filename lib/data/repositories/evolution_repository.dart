import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/data/datasources/endpoints.dart';
import 'package:meu_rastro_carbono/domain/evolution/user_evolution_response.dart';
import 'package:meu_rastro_carbono/ui/pages/tips_page.dart';

import '../../domain/metrics/user_metric_response.dart';
import '../../domain/tips/user_tips_response.dart';
import '../../stores/state_controller.dart';

class UserRevolutionRepository {
  final StateController stateCtrl = Modular.get<StateController>();

  UserRevolutionRepository(httpHelper);

  Future<int> getUserEvolutionPontuation() async {
    final response = await stateCtrl.get(API.getUserEvaluation());

    if (response.statusCode == 200) {
      var pontuation =
          UserEvolutionResponse.fromJson(json.decode(response.body));
      return pontuation.totalPontuation;
    } else {
      throw Exception();
    }
  }

  Future<UserMetricsResponse> getUserMetrics(String token) async {
    final response = await stateCtrl.post(API.getUserMetrics(), null);

    if (response.statusCode == 200) {
      var metrics = UserMetricsResponse.fromJson(json.decode(response.body));
      return metrics;
    } else {
      throw Exception();
    }
  }

  Future<List<Tip>> getUserTips() async {
    final response = await stateCtrl.post(API.getUserTips(), null);

    if (response?.statusCode == 200) {
      var tips = UserTipResponse.fromList(json.decode(response.body));
      return UserTipResponse.toTipModel(tips);
    } else {
      throw Exception();
    }
  }
}

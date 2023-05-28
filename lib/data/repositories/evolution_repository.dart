import 'dart:convert';

import 'package:meu_rastro_carbono/data/datasources/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:meu_rastro_carbono/domain/evolution/user_evolution_response.dart';
import 'package:meu_rastro_carbono/ui/pages/tips_page.dart';

import '../../domain/metrics/user_metric_response.dart';
import '../../domain/tips/user_tips_response.dart';

class UserRevolutionRepository {
  final http.Client client;

  UserRevolutionRepository(this.client);

  Future<int> getUserEvolutionPontuation(String userId) async {
    final response = await client.get(API.getUserEvaluation(userId));

    if (response.statusCode == 200) {
      var pontuation =
          UserEvolutionResponse.fromJson(json.decode(response.body));
      return pontuation.totalPontuation;
    } else {
      throw Exception();
    }
  }

  Future<UserMetricsResponse> getUserMetrics(String userId) async {
    final response = await client.post(API.getUserMetrics(userId));

    if (response.statusCode == 200) {
      var metrics = UserMetricsResponse.fromJson(json.decode(response.body));
      return metrics;
    } else {
      throw Exception();
    }
  }

  Future<List<Tip>> getUserTips(String userId) async {
    final response = await client.post(API.getUserTips(userId));

    if (response.statusCode == 200) {
      var tips = UserTipResponse.fromList(json.decode(response.body));
      return UserTipResponse.toTipModel(tips);
    } else {
      throw Exception();
    }
  }
}

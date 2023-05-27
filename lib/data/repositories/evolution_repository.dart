import 'dart:convert';

import 'package:meu_rastro_carbono/data/datasources/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:meu_rastro_carbono/domain/evolution/user_evolution_response.dart';

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
}

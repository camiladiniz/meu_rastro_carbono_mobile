import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/data/datasources/endpoints.dart';
import 'package:http/http.dart' as http;

import '../../domain/survey/surveys_per_day_response.dart';
import '../../domain/survey/water_survey_payload.dart';
import '../../infra/shared_preference_service.dart';

class SurveyRepository {
  final http.Client client;
  final SharedPreferencesService sharedPreferencesService =
      Modular.get<SharedPreferencesService>();

  SurveyRepository(this.client);

  Future<SurveyPerDayResponse> getSurveyByDate(DateTime date, String userId) async {
    final headers = {'Content-Type': 'application/json'};
    final data = '{"date": "${date.toIso8601String().toString()}", "userId": "$userId"}';

    final response = await client.post(API.getSurveyAnswersByDay(),
        headers: headers, body: data);

    if (response.statusCode == 200) {
      return SurveyPerDayResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

  Future postWaterSurveyAnswer(WaterSurveyPayload payload) async {
    final headers = {'Content-Type': 'application/json'};

    final response = await client.post(API.postWaterSurveyAnswer(),
        headers: headers, body: json.encode(payload));

    if (response.statusCode == 200) {
      return SurveyPerDayResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }
}

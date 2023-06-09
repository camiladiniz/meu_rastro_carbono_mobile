import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/data/datasources/endpoints.dart';
import 'package:meu_rastro_carbono/domain/survey/food_survey_payload.dart';

import '../../domain/survey/electronic_survey_payload.dart';
import '../../domain/survey/locomotion_survey_payload.dart';
import '../../domain/survey/surveys_per_day_response.dart';
import '../../domain/survey/water_survey_payload.dart';
import '../../infra/shared_preference_service.dart';
import '../../stores/state_controller.dart';

class SurveyRepository {
  final StateController stateCtrl = Modular.get<StateController>();
  final SharedPreferencesService sharedPreferencesService =
      Modular.get<SharedPreferencesService>();

  SurveyRepository(httpHelper);

  Future<SurveyPerDayResponse> getSurveyByDate(DateTime date, String userId) async {
    final data = '{"date": "${date.toIso8601String().toString()}", "userId": "$userId"}';

    final response = await stateCtrl.post(API.getSurveyAnswersByDay(), data, true);

    if (response.statusCode == 200) {
      return SurveyPerDayResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

  Future postWaterSurveyAnswer(WaterSurveyPayload payload) async {
    final headers = {'Content-Type': 'application/json'};

    final response = await stateCtrl.post(API.postWaterSurveyAnswer(), payload);

    if (response.statusCode == 200) {
      return SurveyPerDayResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }
  Future postFoodSurveyAnswer(FoodSurveyPayload payload) async {
    final response = await stateCtrl.post(API.postFoodSurveyAnswer(), payload);

    if (response.statusCode == 200) {
      return SurveyPerDayResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

  Future postElectronicSurveyAnswer(ElectronicSurveyPayload payload) async {
    final response = await stateCtrl.post(API.postElectronicSurveyAnswer(), payload);

    if (response.statusCode == 200) {
      return SurveyPerDayResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

  Future postLocomotionSurveyAnswer(LocomotionSurveyPayload payload) async {
    final response = await stateCtrl.post(API.postLocomotionSurveyAnswer(), payload);

    if (response.statusCode == 200) {
      return SurveyPerDayResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }
}

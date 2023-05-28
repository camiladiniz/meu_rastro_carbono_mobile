import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/domain/survey/surveys_per_day_response.dart';
import 'package:meu_rastro_carbono/infra/shared_preference_service.dart';
import 'package:mobx/mobx.dart';

import '../data/repositories/survey_repository.dart';
import '../domain/survey/electronic_survey_payload.dart';
import '../domain/survey/food_survey_payload.dart';
import '../domain/survey/locomotion_survey_payload.dart';
import '../domain/survey/water_survey_payload.dart';
import '../infra/shared_preference_constants.dart';
part 'survey_controller.g.dart';

class SurveyController = _SurveyController with _$SurveyController;

abstract class _SurveyController extends Disposable with Store {
  final SharedPreferencesService localStorage =
      Modular.get<SharedPreferencesService>();
  final SurveyRepository surveyRepo = Modular.get<SurveyRepository>();

  _SurveyController() {
    initializeSharedPreferences();
  }

  Future<void> initializeSharedPreferences() async {
    await localStorage.initializeSharedPreferences();
  }

  @override
  void dispose() {}

  @action
  Future<SurveyPerDayResponse> getSurveysByDate(DateTime date) async {
    try {
      var userId =
          await localStorage.getStringValue(SharedPreferenceConstants.userId);
      var response = await surveyRepo.getSurveyByDate(date, userId);
      return response;
    } catch (ex) {
      // TODO
      return SurveyPerDayResponse(electronicSurvey: true, foodSurvey: true, locomotionSurvey: true, waterSurvey: true);
    }
  }

  @action
  Future postWaterSurveyAnswer(WaterSurveyPayload payload) async {
    try {
      var userId =
          await localStorage.getStringValue(SharedPreferenceConstants.userId);

      payload.userId = userId;
      var response = await surveyRepo.postWaterSurveyAnswer(payload);
      return response;
    } catch (ex) {
      // TODO
    }
  }
  @action
  Future postFoodSurveyAnswer(FoodSurveyPayload payload) async {
    try {
      var userId =
          await localStorage.getStringValue(SharedPreferenceConstants.userId);

      payload.userId = userId;
      var response = await surveyRepo.postFoodSurveyAnswer(payload);
      return response;
    } catch (ex) {
      // TODO
    }
  }
  @action
  Future postElectronicSurveyAnswer(ElectronicSurveyPayload payload) async {
    try {
      var userId =
          await localStorage.getStringValue(SharedPreferenceConstants.userId);

      payload.userId = userId;
      var response = await surveyRepo.postElectronicSurveyAnswer(payload);
      return response;
    } catch (ex) {
      // TODO
    }
  }
  @action
  Future postLocomotionSurveyAnswer(LocomotionSurveyPayload payload) async {
    try {
      var userId =
          await localStorage.getStringValue(SharedPreferenceConstants.userId);

      payload.userId = userId;
      var response = await surveyRepo.postLocomotionSurveyAnswer(payload);
      return response;
    } catch (ex) {
      // TODO
    }
  }
}

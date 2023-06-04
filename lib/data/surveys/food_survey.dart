import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/domain/survey/food_survey_payload.dart';

import '../../stores/survey_controller.dart';
import '../../ui/widgets/models/surveys/survey_question_model.dart';
import '../models/food/meal_model.dart';

final List<SurveyQuestionModel> foodSurveyQuestions = [
  SurveyQuestionModel(
      identification: 'foodPortions',
      question: 'Informe o que você consumiu',
      questionType: SurveyQuestionType.foodConsumption,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: ''),
];

Future<String> mealsFootprintCalculation(
    List<SurveyQuestionModel> survey, DateTime answerConsumptionDate) async {
  final SurveyController surveyController = Modular.get<SurveyController>();
  var foodResponse =
      survey.firstWhere((s) => s.identification == 'foodPortions').userAnswer ??
          '[]';
  var f = json.decode(foodResponse);

  double emissiongCO2eqPerPortion = 0;

  List<MealModel> foodPortions =
      List<MealModel>.from(f.map((model) => MealModel.fromJson(model)));

  var payload = FoodSurveyPayload(
      consumptionDate: answerConsumptionDate,
      carbonEmissionInKgCO2e: 0,
      mealPortionsAmount: 0,
      mealsAmount: 0);

  foodPortions.forEach((meals) {
    meals.mealOptions.forEach((food) {
      emissiongCO2eqPerPortion +=
          food.emissiongCO2eqPerPortion * food.userPortionAmount;
      if (food.userPortionAmount > 0) {
        payload.mealPortionsAmount += food.userPortionAmount;
        payload.mealsAmount++;
      }
    });
  });

  payload.carbonEmissionInKgCO2e = emissiongCO2eqPerPortion / 1000;

  await surveyController.postFoodSurveyAnswer(payload);

  return 'Para essa refeição você emitiu $emissiongCO2eqPerPortion gCO2e na atmosfera';
}
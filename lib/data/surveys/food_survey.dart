import 'dart:convert';

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

String mealsFootprintCalculation(List<SurveyQuestionModel> survey) {
  var foodResponse =
      survey.firstWhere((s) => s.identification == 'foodPortions').userAnswer ?? '[]';
  var f = json.decode(foodResponse);

  double emissiongCO2eqPerPortion = 0;

  List<MealModel> foodPortions = List<MealModel>.from(f.map((model)=> MealModel.fromJson(model)));

  foodPortions.forEach((meals) =>
    meals.mealOptions.forEach((food) =>
      emissiongCO2eqPerPortion += food.emissiongCO2eqPerPortion * food.userPortionAmount
    )
  );

  return 'Para essa refeição você emitiu $emissiongCO2eqPerPortion gCO2 na atmosfera';
  // TODO: store metric
}

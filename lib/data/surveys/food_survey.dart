import '../../ui/widgets/models/surveys/survey_question_model.dart';
import '../datasets/food_carbon_emission_dataset.dart';

final List<SurveyQuestionModel> foodSurveyQuestions = [
  SurveyQuestionModel(
      question: 'Informe o que você consumiu no dia',
      questionType: SurveyQuestionType.foodConsumption,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: ''),
];

String mealsFootprintCalculation(List<SurveyQuestionModel> survey) {
  String finalAnswer = survey[1].userAnswer ?? '0';
  double amountInGrams = double.parse(finalAnswer).toDouble();
  var foodName = survey[0].userAnswer;

  var consumptionInKg = amountInGrams / 1000;
  num carbonEmissionFactor = foodCarbonEmissionPerKgDataset[foodName] ?? 0;

  // calculating emission (CO2e per kg)
  String carbonEmissions =
      (carbonEmissionFactor * consumptionInKg).toStringAsFixed(3);
  return 'Para essa refeição você emitiu $carbonEmissions CO2 na atmosfera';
  // TODO: store metric
}

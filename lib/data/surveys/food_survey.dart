import '../../ui/widgets/models/surveys/survey_answer_model.dart';
import '../../ui/widgets/models/surveys/survey_question_model.dart';
import '../datasets/food_carbon_emission_dataset.dart';

final List<SurveyQuestionModel> foodSurveyQuestions = [
  SurveyQuestionModel(
      question: 'Qual foi o alimento consumido',
      questionType: SurveyQuestionType.option,
      answerOptions: [
        SurveyAnswerModel(
            id: 1, answer: 'Carne bovina', imagePath: '', value: 0),
        SurveyAnswerModel(
            id: 2, answer: 'Carne de cordeiro', imagePath: '', value: 1),
        SurveyAnswerModel(
            id: 3, answer: 'Carne de porco', imagePath: '', value: 2),
        SurveyAnswerModel(id: 4, answer: 'Frango', imagePath: '', value: 3),
        SurveyAnswerModel(id: 5, answer: 'Peixe', imagePath: '', value: 4),
        SurveyAnswerModel(id: 6, answer: 'Ovos', imagePath: '', value: 5),
        SurveyAnswerModel(id: 7, answer: 'Leite', imagePath: '', value: 6),
        SurveyAnswerModel(id: 8, answer: 'Queijo', imagePath: '', value: 7),
        SurveyAnswerModel(id: 9, answer: 'Arroz', imagePath: '', value: 8),
        SurveyAnswerModel(
            id: 10,
            answer: 'Pão',
            imagePath: '',
            value: 9,
            description: 'Derivado do trigo'),
        SurveyAnswerModel(id: 11, answer: 'Batata', imagePath: '', value: 10),
        SurveyAnswerModel(id: 12, answer: 'Tomate', imagePath: '', value: 11),
        SurveyAnswerModel(id: 13, answer: 'Maça', imagePath: '', value: 12),
        SurveyAnswerModel(id: 14, answer: 'Banana', imagePath: '', value: 13),
      ],
      answerPrefix: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      question: 'Qual foi a quantidade consumida?',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: 'gramas'),
  //   SurveyQuestion("Qual o método de produção praticado?", QuestionType.TextAndImage, [
  //   SurveyAnswerModel("Agricultura extensiva", "assets/images/transportation/car.png"),
  //   SurveyAnswerModel("Agricultura intensiva", "assets/images/transportation/bus.png"),
  //   SurveyAnswerModel("Agricultura familiar", "assets/images/transportation/subway.png"),
  //   SurveyAnswerModel("Agricultura patronal", "assets/images/transportation/car.png"),
  //   SurveyAnswerModel("Agricultura orgânica", "assets/images/transportation/bus.png"),
  //   SurveyAnswerModel("Permacultura", "assets/images/transportation/subway.png"),
  //   SurveyAnswerModel("Agricultura comercial", "assets/images/transportation/subway.png"),
  // ], ""),
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
import '../../ui/widgets/models/surveys/survey_answer_model.dart';
import '../../ui/widgets/models/surveys/survey_question_model.dart';

final List<SurveyQuestionModel> transportationSurveyQuestions = [
  SurveyQuestionModel(
      question: 'Qual foi o meio de transporte utilizado por mais tempo?',
      questionType: SurveyQuestionType.textAndImage,
      answerOptions: [
        SurveyAnswerModel(id: 1, answer: 'Nenhum', imagePath: 'lib/ui/assets/images/transportation/block.png', value: 0),
        SurveyAnswerModel(id: 1, answer: 'A pé', imagePath: 'lib/ui/assets/images/transportation/walk.png', value: 1),
        SurveyAnswerModel(id: 1, answer: 'Bicicleta', imagePath: 'lib/ui/assets/images/transportation/bicycle.png', value: 2),
        SurveyAnswerModel(id: 1, answer: 'Carro', imagePath: 'lib/ui/assets/images/transportation/car.png', value: 3),
        SurveyAnswerModel(id: 1, answer: 'Carro', imagePath: 'lib/ui/assets/images/transportation/car.png', value: 4),
        SurveyAnswerModel(id: 2, answer: 'Ônibus', imagePath: 'lib/ui/assets/images/transportation/bus.png', value: 5),
        SurveyAnswerModel(id: 3, answer: 'Metrô', imagePath: 'lib/ui/assets/images/transportation/subway.png', value: 6),
        SurveyAnswerModel(id: 5, answer: 'Moto', imagePath: 'lib/ui/assets/images/transportation/motorcycle.png', value: 8),
        SurveyAnswerModel(id: 4, answer: 'Trem', imagePath: 'lib/ui/assets/images/transportation/train.png', value: 7),
      ],
      answerPrefix: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      question: 'Consumo médio de combustível',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      description: 'O consumo médio de combustível varia bastante entre diferentes veículos, dependendo de fatores como modelo, ano de fabricação, tipo de combustível, entre outros.',
      answerSuffix: 'km/L'),
  SurveyQuestionModel(
      question: 'A distância percorrida foi de',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      description: '',
      answerSuffix: 'km'),
  SurveyQuestionModel(
      question: 'Quantas pessoas compartilharam o transporte?',
      questionType: SurveyQuestionType.option,
      answerOptions: [
        SurveyAnswerModel(
            id: 1, answer: 'Estava sozinho(a)', imagePath: '', value: 1),
        SurveyAnswerModel(id: 2, answer: '2 pessoas', imagePath: '', value: 2),
        SurveyAnswerModel(id: 3, answer: '3 ou mais', imagePath: '', value: 3),
      ],
      answerPrefix: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      question: 'Qual a forma de consumo do meio de transporte utilizado?',
      questionType: SurveyQuestionType.option,
      answerOptions: [
        SurveyAnswerModel(
            id: 1, answer: ' Carro a gasolina', imagePath: '', value: 1),
        SurveyAnswerModel(
            id: 2, answer: ' Carro flex', imagePath: '', value: 2),
        SurveyAnswerModel(
            id: 3, answer: ' Carro elétrico', imagePath: '', value: 3),
        SurveyAnswerModel(id: 4, answer: ' Ônibus', imagePath: '', value: 4),
        SurveyAnswerModel(id: 5, answer: ' Trem', imagePath: '', value: 5),
        SurveyAnswerModel(id: 6, answer: ' Metrô', imagePath: '', value: 6),
      ],
      answerPrefix: '',
      answerSuffix: ''),
];

String transportationFootprintCalculation(List<SurveyQuestionModel> survey) {
  final String transportation = survey[0].userAnswer ?? '';
  final double distance = double.parse((survey[2].userAnswer ?? '0'));
  final double peopleAmount = double.parse((survey[3].userAnswer ?? '0'));
  final double consumoCombustivelMedio = double.parse((survey[1].userAnswer ?? '0'));
  final String formaDeConsumo = survey[4].userAnswer ?? '';

  double carbonEmission = 0;

  switch (transportation) {
    case 'Carro':
    const double emissionFactor = 2.62;
    // Fator de emissão: 2,32 kg CO2e/litro de gasolina ou 2,62 kg CO2e/litro de etanol, de acordo com o IPCC (Painel Intergovernamental sobre Mudanças Climáticas) de 2013
      carbonEmission = (distance * consumoCombustivelMedio * emissionFactor) / peopleAmount;

      break;
    case 'Ônibus':
      break;
    case 'Metrô':
      break;
    case 'Trem':
      break;
    default:
      break;
  }

  return 'Para sua locomoção você emitiu ${carbonEmission.toStringAsFixed(3)} kg CO2e na atmosfera.';
}

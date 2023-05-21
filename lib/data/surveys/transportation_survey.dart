import 'package:meu_rastro_carbono/data/datasets/transportation_carbon_emission_dataset.dart';

import '../../ui/widgets/models/surveys/survey_answer_model.dart';
import '../../ui/widgets/models/surveys/survey_question_model.dart';

final List<SurveyQuestionModel> transportationSurveyQuestions = [
  SurveyQuestionModel(
      identification: 'transportType',
      question: 'Qual foi o meio de transporte utilizado por mais tempo?',
      questionType: SurveyQuestionType.textAndImage,
      answerOptions: [
        SurveyAnswerModel(
            id: TransportationTypes.none.index,
            answer: 'Nenhum',
            imagePath: 'lib/ui/assets/images/transportation/block.png',
            value: TransportationTypes.none.index),
        SurveyAnswerModel(
            id: TransportationTypes.walking.index,
            answer: 'A pé',
            imagePath: 'lib/ui/assets/images/transportation/walk.png',
            value: TransportationTypes.walking.index),
        SurveyAnswerModel(
            id: TransportationTypes.bicycle.index,
            answer: 'Bicicleta',
            imagePath: 'lib/ui/assets/images/transportation/bicycle.png',
            value: TransportationTypes.bicycle.index),
        SurveyAnswerModel(
            id: TransportationTypes.car.index,
            answer: 'Carro',
            imagePath: 'lib/ui/assets/images/transportation/car.png',
            value: TransportationTypes.car.index),
        SurveyAnswerModel(
            id: TransportationTypes.bus.index,
            answer: 'Ônibus',
            imagePath: 'lib/ui/assets/images/transportation/bus.png',
            value: TransportationTypes.bus.index),
        SurveyAnswerModel(
            id: TransportationTypes.subway.index,
            answer: 'Metrô',
            imagePath: 'lib/ui/assets/images/transportation/subway.png',
            value: TransportationTypes.subway.index),
        SurveyAnswerModel(
            id: TransportationTypes.motorcycle.index,
            answer: 'Moto',
            imagePath: 'lib/ui/assets/images/transportation/motorcycle.png',
            value: TransportationTypes.motorcycle.index),
        SurveyAnswerModel(
            id: TransportationTypes.train.index,
            answer: 'Trem',
            imagePath: 'lib/ui/assets/images/transportation/train.png',
            value: TransportationTypes.train.index)
      ],
      answerPrefix: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'motorcycleFuel',
      question: 'Qual o combustível que você utiliza?',
      questionType: SurveyQuestionType.option,
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
              .firstWhere((q) => q.identification == 'transportType')
              .userAnswer !=
          'Moto',
      answerOptions: [
        SurveyAnswerModel(id: 1, answer: 'Gasolina', imagePath: '', value: 1),
        SurveyAnswerModel(id: 2, answer: 'Etanol', imagePath: '', value: 2),
      ],
      answerPrefix: '',
      description: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'motorCycleMotor',
      question: 'Qual é o motor da sua moto?',
      questionType: SurveyQuestionType.option,
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
              .firstWhere((q) => q.identification == 'transportType')
              .userAnswer !=
          'Moto',
      answerOptions: [
        SurveyAnswerModel(id: 1, answer: 'Até 155cc', imagePath: '', value: 1),
        SurveyAnswerModel(
            id: 2, answer: 'De 126cc a 250cc', imagePath: '', value: 2),
        SurveyAnswerModel(
            id: 3, answer: 'De 151cc em diante', imagePath: '', value: 3),
      ],
      answerPrefix: '',
      description: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: '',
      question: 'Consumo médio de combustível',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      description:
          'O consumo médio de combustível varia bastante entre diferentes veículos, dependendo de fatores como modelo, ano de fabricação, tipo de combustível, entre outros.',
      answerSuffix: 'km/L'),
  SurveyQuestionModel(
      identification: 'distanceKm',
      question: 'A distância percorrida foi de',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      description: '',
      answerSuffix: 'km'),
  SurveyQuestionModel(
      identification: 'amountOfPeople',
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
      identification: 'consumptionModel',
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
  final double consumoCombustivelMedio =
      double.parse((survey[1].userAnswer ?? '0'));
  final String formaDeConsumo = survey[4].userAnswer ?? '';

  double carbonEmission = 0;

  switch (transportation) {
    case 'Carro':
      const double emissionFactor = 2.62;
      // Fator de emissão: 2,32 kg CO2e/litro de gasolina ou 2,62 kg CO2e/litro de etanol, de acordo com o IPCC (Painel Intergovernamental sobre Mudanças Climáticas) de 2013
      carbonEmission =
          (distance * consumoCombustivelMedio * emissionFactor) / peopleAmount;

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

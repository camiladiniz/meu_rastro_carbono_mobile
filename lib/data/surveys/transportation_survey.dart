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
      question: 'Qual o combustível que você utiliza na sua moto?',
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
      question: 'Que motor sua moto utiliza?',
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
      identification: 'carFuel',
      question: 'Qual o combustível/tipo do seu carro?',
      questionType: SurveyQuestionType.option,
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
              .firstWhere((q) => q.identification == 'transportType')
              .userAnswer !=
          'Carro',
      answerOptions: [
        SurveyAnswerModel(id: 1, answer: 'Diesel', imagePath: '', value: 1),
        SurveyAnswerModel(id: 2, answer: 'Etanol', imagePath: '', value: 2),
        SurveyAnswerModel(id: 3, answer: 'Gasolina', imagePath: '', value: 3),
        SurveyAnswerModel(id: 4, answer: 'GNV', imagePath: '', value: 4),
        SurveyAnswerModel(id: 5, answer: 'Elétrico', imagePath: '', value: 5),
        SurveyAnswerModel(id: 6, answer: 'Híbrido', imagePath: '', value: 6),
      ],
      answerPrefix: '',
      description: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'carMotor',
      question: 'Qual o motor do seu carro?',
      questionType: SurveyQuestionType.option,
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
                  .firstWhere((q) => q.identification == 'transportType')
                  .userAnswer !=
              'Carro' ||
          (questions
                      .firstWhere((q) => q.identification == 'carFuel')
                      .userAnswer !=
                  'Diesel' &&
              questions
                      .firstWhere((q) => q.identification == 'carFuel')
                      .userAnswer !=
                  'Etanol' &&
              questions
                      .firstWhere((q) => q.identification == 'carFuel')
                      .userAnswer !=
                  'Gasolina' &&
              questions
                      .firstWhere((q) => q.identification == 'carFuel')
                      .userAnswer !=
                  'GNV'),
      answerOptions: [
        SurveyAnswerModel(id: 1, answer: '1.0 a 1.5', imagePath: '', value: 1),
        SurveyAnswerModel(id: 2, answer: '1.6 a 2.0', imagePath: '', value: 2),
        SurveyAnswerModel(
            id: 3, answer: 'Maior que 2.0', imagePath: '', value: 3),
      ],
      answerPrefix: '',
      description: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'carElectricFuel',
      question: 'Qual é o modelo do seu carro elétrico?',
      questionType: SurveyQuestionType.option,
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
                  .firstWhere((q) => q.identification == 'transportType')
                  .userAnswer !=
              'Carro' ||
          questions
                  .firstWhere((q) => q.identification == 'carFuel')
                  .userAnswer !=
              'Elétrico',
      answerOptions: [
        SurveyAnswerModel(
            id: 1, answer: 'Renault Zoe', imagePath: '', value: 1),
        SurveyAnswerModel(
            id: 2, answer: 'Cherry Arrizo 5e', imagePath: '', value: 2),
        SurveyAnswerModel(id: 3, answer: 'JAC iEV40', imagePath: '', value: 3),
        SurveyAnswerModel(
            id: 4, answer: 'Nissan Leaf', imagePath: '', value: 4),
        SurveyAnswerModel(id: 5, answer: 'BMW i3', imagePath: '', value: 5),
        SurveyAnswerModel(
            id: 6, answer: 'Chevrolet Bolt', imagePath: '', value: 6),
        SurveyAnswerModel(
            id: 7, answer: 'Jaguar I-Pace', imagePath: '', value: 7),
        SurveyAnswerModel(id: 8, answer: 'Outro', imagePath: '', value: 8),
      ],
      answerPrefix: '',
      description: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'carHybridFuel',
      question: 'Qual é o combustível do seu carro híbrido?',
      questionType: SurveyQuestionType.option,
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
                  .firstWhere((q) => q.identification == 'transportType')
                  .userAnswer !=
              'Carro' ||
          questions
                  .firstWhere((q) => q.identification == 'carFuel')
                  .userAnswer !=
              'Híbrido',
      answerOptions: [
        SurveyAnswerModel(id: 1, answer: 'Gasolina', imagePath: '', value: 1),
        SurveyAnswerModel(id: 2, answer: 'Diesel', imagePath: '', value: 2),
        SurveyAnswerModel(id: 3, answer: 'Etanol', imagePath: '', value: 3),
      ],
      answerPrefix: '',
      description: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'carHybridFuel',
      question: 'Qual a autonomia do seu carro?',
      questionType: SurveyQuestionType.anyNumber,
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
                  .firstWhere((q) => q.identification == 'transportType')
                  .userAnswer !=
              'Carro' ||
          questions
                  .firstWhere((q) => q.identification == 'carFuel')
                  .userAnswer !=
              'Híbrido',
      answerOptions: [],
      answerPrefix: '',
      description: 'A média de autonomia de um carro híbrido é de 20 km/litro',
      answerSuffix: 'km/litro'),
  SurveyQuestionModel(
      identification: 'distanceKm',
      question: 'A distância percorrida no dia foi de',
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
                  .firstWhere((q) => q.identification == 'transportType')
                  .userAnswer ==
              'Nenhum',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      description: '',
      answerSuffix: 'km'),
  SurveyQuestionModel(
      identification: 'amountOfPeople',
      question: 'Quantas pessoas compartilharam o transporte?',
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
                  .firstWhere((q) => q.identification == 'transportType')
                  .userAnswer !=
              'Carro' ||
          questions
                  .firstWhere((q) => q.identification == 'transportType')
                  .userAnswer !=
              'Moto',
      questionType: SurveyQuestionType.option,
      answerOptions: [
        SurveyAnswerModel(
            id: 1, answer: 'Estava sozinho(a)', imagePath: '', value: 1),
        SurveyAnswerModel(id: 2, answer: '2 pessoas', imagePath: '', value: 2),
        SurveyAnswerModel(id: 3, answer: '3 ou mais', imagePath: '', value: 3),
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

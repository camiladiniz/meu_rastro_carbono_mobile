import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/data/datasets/transport/transportation_carbon_emission_dataset.dart';

import '../../domain/survey/locomotion_survey_payload.dart';
import '../../stores/survey_controller.dart';
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
            answer: 'Ônibus Municipal',
            imagePath: 'lib/ui/assets/images/transportation/bus.png',
            value: TransportationTypes.bus.index),
        SurveyAnswerModel(
            id: TransportationTypes.travelBus.index,
            answer: 'Ônibus de Viagem',
            imagePath: 'lib/ui/assets/images/transportation/bus.png',
            value: TransportationTypes.travelBus.index),
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
        SurveyAnswerModel(
            id: 1, answer: defaultMotocycleMotor1, imagePath: '', value: 1),
        SurveyAnswerModel(
            id: 2, answer: defaultMotocycleMotor2, imagePath: '', value: 2),
        SurveyAnswerModel(
            id: 3, answer: defaultMotocycleMotor3, imagePath: '', value: 3),
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
        SurveyAnswerModel(
            id: 1, answer: defaultCarMotor1, imagePath: '', value: 1),
        SurveyAnswerModel(
            id: 2, answer: defaultCarMotor2, imagePath: '', value: 2),
        SurveyAnswerModel(
            id: 3, answer: defaultCarMotor3, imagePath: '', value: 3),
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
            id: 1,
            answer: ElectricCarModels.renaultZoe,
            imagePath: '',
            value: 1),
        SurveyAnswerModel(
            id: 2,
            answer: ElectricCarModels.cherryArrizo5e,
            imagePath: '',
            value: 2),
        SurveyAnswerModel(
            id: 3, answer: ElectricCarModels.jACiEV40, imagePath: '', value: 3),
        SurveyAnswerModel(
            id: 4,
            answer: ElectricCarModels.nissanLeaf,
            imagePath: '',
            value: 4),
        SurveyAnswerModel(
            id: 5, answer: ElectricCarModels.bMWi3, imagePath: '', value: 5),
        SurveyAnswerModel(
            id: 6,
            answer: ElectricCarModels.chevroletBolt,
            imagePath: '',
            value: 6),
        SurveyAnswerModel(
            id: 7,
            answer: ElectricCarModels.jaguarIPace,
            imagePath: '',
            value: 7),
        SurveyAnswerModel(
            id: 8, answer: ElectricCarModels.outro, imagePath: '', value: 8),
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
      identification: 'carHybridAutonomy',
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
];

Future<String> transportationFootprintCalculation(
    List<SurveyQuestionModel> survey, DateTime answerConsumptionDate) async {
  final SurveyController surveyController = Modular.get<SurveyController>();

  // shared
  var transport =
      survey.firstWhere((s) => s.identification == 'transportType').userAnswer;

  var distanceKmResponse =
      survey.firstWhere((s) => s.identification == 'distanceKm').userAnswer ??
          '0'; // except by none
  var distanceKm = double.parse(distanceKmResponse);

  var payload = LocomotionSurveyPayload(
      consumptionDate: answerConsumptionDate,
      distanceInKm: distanceKm,
      carbonEmissionInKgCO2e: 0,
      transportType: TransportationTypes.walking,
      motorcycleFuel: null,
      motorCycleMotor: null,
      carFuel: null,
      carMotor: null,
      carElectricFuel: null,
      carHybridFuel: null,
      carHybridAutonomy: null);

  //motorcycle
  var motorcycleFuel = survey
          .firstWhere((s) => s.identification == 'motorcycleFuel')
          .userAnswer ??
      '0';

  var motorCycleMotor = survey
          .firstWhere((s) => s.identification == 'motorCycleMotor')
          .userAnswer ??
      '0';

  // car
  var carFuel =
      survey.firstWhere((s) => s.identification == 'carFuel').userAnswer;
  var carMotor =
      survey.firstWhere((s) => s.identification == 'carMotor').userAnswer;
  // electric car
  var carElectricFuelModel = survey
      .firstWhere((s) => s.identification == 'carElectricFuel')
      .userAnswer;
  // hybrid car
  var carHybridFuel =
      survey.firstWhere((s) => s.identification == 'carHybridFuel').userAnswer;
  var carHybridAutonomyResponse = survey
          .firstWhere((s) => s.identification == 'carHybridAutonomy')
          .userAnswer ??
      '0';
  var carHybridAutonomy = double.parse(carHybridAutonomyResponse);

  double carbonEmissionKgPerCO = 0;
  double fuelEmission = 0;

  switch (transport) {
    case 'Nenhum':
      payload.transportType = TransportationTypes.none;
      break;
    case 'A pé':
      payload.transportType = TransportationTypes.walking;
      break;
    case 'Bicicleta':
      payload.transportType = TransportationTypes.bicycle;
      break;

    case 'Carro':
      payload.transportType = TransportationTypes.car;
      payload.carFuel = carFuel;
      payload.carMotor = carMotor;
      switch (carFuel) {
        case 'Diesel':
          fuelEmission = dieselKgCOEmission[carMotor] ?? 0;
          break;

        case 'Etanol':
          fuelEmission = etanolKgCOEmission[carMotor] ?? 0;
          break;

        case 'Gasolina':
          fuelEmission = gasolinaKgCOEmission[carMotor] ?? 0;
          break;

        case 'GNV':
          fuelEmission = gnvKgCOEmission[carMotor] ?? 0;
          break;

        case 'Elétrico':
          fuelEmission = carElectricKgCOPerModel[carElectricFuelModel] ?? 0;
          payload.carElectricFuel = carElectricFuelModel;
          break;

        case 'Híbrido':
          // fator de emissão por km é calculado considerando emissão/autonomia
          double carHybridFuelFactor =
              hybridCarKgCOEmission[carHybridFuel] ?? 0;
          fuelEmission = carHybridFuelFactor / carHybridAutonomy;
          payload.carHybridFuel = carHybridFuel;
          payload.carHybridAutonomy = carHybridAutonomy;
          break;
      }

      carbonEmissionKgPerCO = fuelEmission * distanceKm;
      break;

    case 'Ônibus Municipal':
      payload.transportType = TransportationTypes.bus;
      carbonEmissionKgPerCO = CollectiveTransport.municipalBus * distanceKm;
      break;

    case 'Ônibus de Viagem':
      payload.transportType = TransportationTypes.travelBus;
      carbonEmissionKgPerCO = CollectiveTransport.travelBus * distanceKm;
      break;

    case 'Metrô':
      payload.transportType = TransportationTypes.subway;
      carbonEmissionKgPerCO = CollectiveTransport.subway * distanceKm;
      break;

    case 'Moto':
      payload.transportType = TransportationTypes.motorcycle;
      payload.motorcycleFuel = motorcycleFuel;
      payload.motorCycleMotor = motorCycleMotor;

      switch (motorcycleFuel) {
        case 'Gasolina':
          fuelEmission = motocyleGasolinaKgCOEmission[motorCycleMotor] ?? 0;
          break;

        case 'Etanol':
          fuelEmission = motocyleEtanolKgCOEmission[motorCycleMotor] ?? 0;
          break;
      }

      carbonEmissionKgPerCO = distanceKm * fuelEmission;
      break;

    case 'Trem':
      payload.transportType = TransportationTypes.train;
      carbonEmissionKgPerCO = CollectiveTransport.train * distanceKm;
      break;

    default:
      break;
  }

  payload.carbonEmissionInKgCO2e = carbonEmissionKgPerCO;
  payload.distanceInKm = distanceKm;

  await surveyController.postLocomotionSurveyAnswer(payload);

  return carbonEmissionKgPerCO == 0
      ? 'Parabéns! Você não emitiu CO2e na atmosfera para realizar suas atividades hoje'
      : 'Para sua locomoção você emitiu ${carbonEmissionKgPerCO.toStringAsFixed(4).replaceFirst('.', ',')} kg CO2e na atmosfera.';
}

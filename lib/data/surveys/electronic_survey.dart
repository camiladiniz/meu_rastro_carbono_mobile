import '../../ui/widgets/models/surveys/survey_answer_model.dart';
import '../../ui/widgets/models/surveys/survey_question_model.dart';
import '../datasets/electronic/electronic_carbon_emission_dataset.dart';

final List<SurveyQuestionModel> electronicSurveyQuestions = [
  SurveyQuestionModel(
      identification: 'cellphoneUsageInHours',
      question: 'Hoje o celular ficou na tomada por',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: 'horas'),
  SurveyQuestionModel(
      identification: 'hadUsedComputer',
      question: 'Você utilizou computador ou notebook?',
      questionType: SurveyQuestionType.yesOrNo,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'computerUsageInMinutes',
      question: 'Por quanto tempo o computador (ou notebook) ficou ligado?',
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
              .firstWhere((q) => q.identification == 'hadUsedComputer')
              .userAnswer !=
          QuestionTypeYesOrNo.yes,
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: 'minutos'),
  SurveyQuestionModel(
      identification: 'computerCoreType',
      question:
          'Seu dispositivo possui processador ou placa de vídeo dedicada?',
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
              .firstWhere((q) => q.identification == 'hadUsedComputer')
              .userAnswer !=
          QuestionTypeYesOrNo.yes,
      questionType: SurveyQuestionType.option,
      answerOptions: [
        SurveyAnswerModel(
            id: 1, answer: ComputerCoreTypes.cpu, imagePath: '', value: 1),
        SurveyAnswerModel(
            id: 2, answer: ComputerCoreTypes.gpu, imagePath: '', value: 2),
        SurveyAnswerModel(
            id: 3, answer: ComputerCoreTypes.ambos, imagePath: '', value: 3)
      ],
      answerPrefix: '',
      description: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'computerCoresAmount',
      question: 'Quantos cores tem seu processador?',
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
                  .firstWhere((q) => q.identification == 'hadUsedComputer')
                  .userAnswer !=
              QuestionTypeYesOrNo.yes ||
          questions
                  .firstWhere((q) => q.identification == 'computerCoreType')
                  .userAnswer ==
              ComputerCoreTypes.gpu,
      questionType: SurveyQuestionType.option,
      answerOptions: [
        SurveyAnswerModel(id: 1, answer: '2', imagePath: '', value: 2),
        SurveyAnswerModel(id: 2, answer: '4', imagePath: '', value: 4),
        SurveyAnswerModel(id: 3, answer: '8', imagePath: '', value: 8),
        SurveyAnswerModel(id: 4, answer: '10', imagePath: '', value: 10),
        SurveyAnswerModel(id: 5, answer: '12', imagePath: '', value: 12),
        SurveyAnswerModel(id: 6, answer: '16', imagePath: '', value: 16)
      ],
      answerPrefix: '',
      description: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'computerCPUModel',
      question: 'Qual o modelo do processador?',
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
                  .firstWhere((q) => q.identification == 'hadUsedComputer')
                  .userAnswer !=
              QuestionTypeYesOrNo.yes ||
          questions
                  .firstWhere((q) => q.identification == 'computerCoreType')
                  .userAnswer ==
              ComputerCoreTypes.gpu,
      questionType: SurveyQuestionType.option,
      answerOptions: ComputerDataset.computerCoreTypes
          .map((c) => SurveyAnswerModel(
              id: ComputerDataset.computerCoreTypes.indexOf(c),
              answer: c.model,
              imagePath: '',
              value: ComputerDataset.computerCoreTypes.indexOf(c)))
          .toList(),
      answerPrefix: '',
      description: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'computerGPUModel',
      question: 'Qual o modelo da placa de vídeo?',
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
                  .firstWhere((q) => q.identification == 'hadUsedComputer')
                  .userAnswer !=
              QuestionTypeYesOrNo.yes ||
          questions
                  .firstWhere((q) => q.identification == 'computerCoreType')
                  .userAnswer ==
              ComputerCoreTypes.cpu,
      questionType: SurveyQuestionType.option,
      answerOptions: ComputerDataset.computerGPUTypes
          .map((c) => SurveyAnswerModel(
              id: ComputerDataset.computerGPUTypes.indexOf(c),
              answer: c.model,
              imagePath: '',
              value: ComputerDataset.computerGPUTypes.indexOf(c)))
          .toList(),
      answerPrefix: '',
      description: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'computerAvailableMemory',
      skipQuestion: (List<SurveyQuestionModel> questions) =>
          questions
              .firstWhere((q) => q.identification == 'hadUsedComputer')
              .userAnswer !=
          QuestionTypeYesOrNo.yes,
      question: 'Qual a quantidade de memória disponível?',
      questionType: SurveyQuestionType.option,
      answerOptions: [
        SurveyAnswerModel(id: 1, answer: '2', imagePath: '', value: 2),
        SurveyAnswerModel(id: 2, answer: '4', imagePath: '', value: 4),
        SurveyAnswerModel(id: 3, answer: '8', imagePath: '', value: 8),
        SurveyAnswerModel(id: 4, answer: '16', imagePath: '', value: 16),
        SurveyAnswerModel(id: 5, answer: '32', imagePath: '', value: 32),
        SurveyAnswerModel(id: 6, answer: '64', imagePath: '', value: 64)
      ],
      answerPrefix: '',
      answerSuffix: 'GB'),
  SurveyQuestionModel(
      identification: 'streamingUsageInMinutes',
      question: 'Quantos minutos você passou assistindo streaming hoje?',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: 'minutos'),
  SurveyQuestionModel(
      identification: 'lampsOperationTime',
      question: 'Indique as lâmpadas ligadas e o respectivo tempo de uso:',
      questionType: SurveyQuestionType.turnOnLamps,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'lampType',
      question: 'Qual é o tipo de lâmpada utilizada?',
      questionType: SurveyQuestionType.option,
      answerOptions: [
        SurveyAnswerModel(
            id: 1, answer: 'Incandescente', imagePath: '', value: 1),
        SurveyAnswerModel(id: 2, answer: 'LED', imagePath: '', value: 2),
      ],
      answerPrefix: '',
      answerSuffix: ''),
];

String electricFootprintCalculation(List<SurveyQuestionModel> survey) {
  String phoneUsageInHoursResponse = survey
          .firstWhere((s) => s.identification == 'cellphoneUsageInHours')
          .userAnswer ??
      '0';
  double phoneUsageInHours = double.parse(phoneUsageInHoursResponse);

  String hadUsedComputerResponse = survey
          .firstWhere((s) => s.identification == 'hadUsedComputer')
          .userAnswer ??
      QuestionTypeYesOrNo.no;
  bool hadUsedComputer = hadUsedComputerResponse == QuestionTypeYesOrNo.yes;

  String computerUsageInMinutesResponse = survey
          .firstWhere((s) => s.identification == 'computerUsageInMinutes')
          .userAnswer ??
      '0';
  double computerUsageInMinutes = double.parse(computerUsageInMinutesResponse);

  String computerCoreType = survey
          .firstWhere((s) => s.identification == 'computerCoreType')
          .userAnswer ??
      '';

  String computerCoresAmountResponse = survey
          .firstWhere((s) => s.identification == 'computerCoresAmount')
          .userAnswer ??
      '0';
  int computerCoresAmount = int.parse(computerCoresAmountResponse);

  String computerCPUModel = survey
          .firstWhere((s) => s.identification == 'computerCPUModel')
          .userAnswer ??
      '';

  String computerGPUModel = survey
          .firstWhere((s) => s.identification == 'computerGPUModel')
          .userAnswer ??
      '';

  String computerAvailableMemoryResponse = survey
          .firstWhere((s) => s.identification == 'computerAvailableMemory')
          .userAnswer ??
      '0';
  int computerAvailableMemory = int.parse(computerAvailableMemoryResponse);

  String streamingUsageInMinutesResponse = survey
          .firstWhere((s) => s.identification == 'streamingUsageInMinutes')
          .userAnswer ??
      '0';
  double streamingUsageInMinutes =
      double.parse(streamingUsageInMinutesResponse);

  String lampsOperationTimesResponse = survey
          .firstWhere((s) => s.identification == 'lampsOperationTime')
          .userAnswer ??
      '0';
  List<double> lampsOperationTimes = [];

  if (lampsOperationTimesResponse.isNotEmpty) {
    lampsOperationTimes = lampsOperationTimesResponse
        .split(",")
        .map((o) => double.parse(o))
        .toList();
  }

  String lampType =
      survey.firstWhere((s) => s.identification == 'lampType').userAnswer ?? '';

  // calculating carbon emission
  double phoneCarbon = 0;
  double computerCarbon = 0;
  double tvCarbon = 0;
  double lampsCarbon = 0;

  // ----- cellphone charging -----
  if (phoneUsageInHours > 0) {
    double maintenanceModePowerTime = 24 - phoneUsageInHours;

    // ex: [14.46 Wh – (22 hours x 0.13 Watts)] x 1 kWh/1,000 Wh = 0.012 kWh/smartphone charged
    double energy = (phoneBatteryConsumption24HourEnergyInWattHours -
            (maintenanceModePowerTime * maintenanceModePowerFactorInWatts)) *
        1 /
        1000;

    // ex: 0.012 kWh/charge x 1,562.4 pounds CO2/MWh delivered electricity x 1 MWh/1,000 kWh x 1 metric ton/2,204.6 lbs = 8.22 x 10-6 metric tons CO2/smartphone charged
    phoneCarbon = energy * 1562.4 * (1 / 1000) * (1 / 2204.6);
  }

  // ----- computer usage calculation -----
  var computerFootprintResponse = calculateComputerFootprint(
      computerCoreType,
      computerCoresAmount,
      computerCPUModel,
      computerGPUModel,
      computerAvailableMemory,
      computerUsageInMinutes);

  computerCarbon = computerFootprintResponse.carbonEmissionsInGrams / 1000;

  //  ----- television usage calculation -----
  double televisionTimeInHours = streamingUsageInMinutes / 60;
  tvCarbon = televisionTimeInHours * streamingCarbonEmissionPerHourInKg;

  //  ----- lamps usage calculation -----
  var lampEnergyInWatts = lampType == 'LED'
      ? LampEnergyInWatts.led
      : LampEnergyInWatts.incandescente;
  double lampEnergyConsumptionInWattHour = 0;

  lampsOperationTimes.forEach((operationTime) {
    lampEnergyConsumptionInWattHour += operationTime * lampEnergyInWatts;
  });

  var lampEnergyConsumptionInQuiloWattHour =
      lampEnergyConsumptionInWattHour / 1000;

  lampsCarbon = lampEnergyConsumptionInQuiloWattHour *
      electricityCarbonEmissionFactorPerkWh;

  //  ----- Summing up carbon footprints for all devices -----
  String totalCarbonFootprint =
      (phoneCarbon + computerCarbon + tvCarbon + lampsCarbon)
          .toStringAsFixed(3);

  return 'Você emitiu $totalCarbonFootprint CO2 na atmosfera utilizando dispositivos';
}

ComputerEmissionModel calculateComputerFootprint(
  String coreType,
  int cpuCoresAmount,
  String cpuModel,
  String gpuModel,
  int memory,
  double runTime_minutes,
) {
  double n_GPUs = 1;

  // Runtime
  double test_runTime = 1;
  double actual_runTime_hours = 0;
  double runTime = 0;
  double cpuPower = 0;
  double usageCPU_used = 1; // não pedir fator ao usuario
  double usageGPU_used = 1; // não pedir fator ao usuario
  double powerNeeded_CPU;
  double gpuPower = 0;
  double powerNeeded_GPU;
  double carbonIntensity;
  double psf_used;
  double powerNeeded;

  actual_runTime_hours = runTime_minutes / 60;

  runTime = actual_runTime_hours;

  // PUE
  double defaultPUE = ComputerDataset.defaultPUE;
  int pue_used = 1;

  // CORES

  if (coreType == ComputerCoreTypes.cpu ||
      coreType == ComputerCoreTypes.ambos) {
    cpuPower = ComputerDataset.computerCoreTypes
        .firstWhere((c) => c.model == cpuModel)
        .tdpPerCore;
    usageCPU_used = 1;
    powerNeeded_CPU = pue_used * cpuCoresAmount * cpuPower * usageCPU_used;
  } else {
    powerNeeded_CPU = 0;
    cpuPower = 0;
  }

  if (coreType == ComputerCoreTypes.gpu ||
      coreType == ComputerCoreTypes.ambos) {
    gpuPower = ComputerDataset.computerGPUTypes
        .firstWhere((c) => c.model == gpuModel)
        .tdpPerCore;
    powerNeeded_GPU = pue_used * n_GPUs * gpuPower * usageGPU_used;
  } else {
    powerNeeded_GPU = 0;
    gpuPower = 0;
  }

  // SERVER/LOCATION
  carbonIntensity = BrazilCarbonEmission.carbonIntensity;
  psf_used = 1;

  // Power needed, in Watt
  double powerNeeded_core = powerNeeded_CPU + powerNeeded_GPU;
  var powerNeeded_memory =
      pue_used * (memory * ComputerReferenceValues.memoryPower);
  powerNeeded = powerNeeded_core + powerNeeded_memory;

  // Energy needed, in kWh (so dividing by 1000 to convert to kW)
  var energyNeededCPU = runTime * powerNeeded_CPU * psf_used / 1000;
  var energyNeededGPU = runTime * powerNeeded_GPU * psf_used / 1000;
  var energyNeededCore = runTime * powerNeeded_core * psf_used / 1000;
  var eneregyNeededMemory = runTime * powerNeeded_memory * psf_used / 1000;
  var energyNeeded = runTime * powerNeeded * psf_used / 1000;

  // Carbon emissions: carbonIntensity is in g per kWh, so results in gCO2
  var cpuCarbonEmission = energyNeededCPU * carbonIntensity;
  var gpuCarbonEmission = energyNeededGPU * carbonIntensity;
  var coreCarbonEmission = energyNeededCore * carbonIntensity;
  var memoryCarbonEmission = eneregyNeededMemory * carbonIntensity;
  var carbonEmissions = energyNeeded * carbonIntensity;

  var result = ComputerEmissionModel();

  result.coreType = coreType;
  result.modelCPU = cpuModel;
  result.coresCPU = cpuCoresAmount;
  result.powerCPU = cpuPower;
  result.powerGPU = gpuPower;
  result.modelGPU = gpuModel;
  result.amountGPU = n_GPUs;
  result.memory = memory;
  result.runTimeInHours = actual_runTime_hours;
  result.runtime = runTime;
  result.carbonIntensity = carbonIntensity;
  result.pueUsed = pue_used;
  result.psfUsed = psf_used;
  result.carbonEmissionsInGrams = carbonEmissions; // in g CO2e
  result.carbonEmissionCPU = cpuCarbonEmission;
  result.carbonEmissionGPU = gpuCarbonEmission;
  result.carbonEmissionCore = coreCarbonEmission;
  result.carbonEmissionMemory = memoryCarbonEmission;
  result.energyNeeded = energyNeeded;
  result.powerNeeded = powerNeeded;

  // CONTEXT
  result.treeMonths = carbonEmissions / ComputerReferenceValues.treeYear * 12;

// TODO: AJUSTAR
  if (carbonEmissions < 0.5 * ComputerReferenceValues.flightNY_SF) {
    result.flyingContext = ComputerReferenceValues.flightPAR_LON;
    result.flyingText = 'Paris-Londres';
  } else if (carbonEmissions < 0.5 * ComputerReferenceValues.flightNYC_MEL) {
    result.flyingContext = ComputerReferenceValues.flightNY_SF;
    result.flyingText = 'Nova York-São Francisco';
  } else {
    result.flyingContext = ComputerReferenceValues.flightNYC_MEL;
    result.flyingText = 'Nova York-Melbourne';
  }

  result.carbonEmissionsUnit = "g";
  var carbonEmissions_value = carbonEmissions;
  var carbonEmissions_unit = "g";

  if (carbonEmissions_value >= 1e6) {
    carbonEmissions_value /= 1e6;
    carbonEmissions_unit = "T";
  } else if (carbonEmissions_value >= 1e3) {
    carbonEmissions_value /= 1e3;
    carbonEmissions_unit = "kg";
  } else if (carbonEmissions_value < 1) {
    carbonEmissions_value *= 1e3;
    carbonEmissions_unit = "mg";
  }

  if ((carbonEmissions_value != 0) &
      ((carbonEmissions_value >= 1e3) | (carbonEmissions_value < 1))) {
    result.carbonEmissionText =
        "$carbonEmissions_value $carbonEmissions_unit CO2e";
  } else {
    result.carbonEmissionText =
        "$carbonEmissions_value $carbonEmissions_unit CO2e";
  }

  // text energy
  var energyNeeded_value = energyNeeded; // in kWh
  var energyNeeded_unit = "kWh";
  if (energyNeeded_value >= 1e3) {
    energyNeeded_value /= 1e3;
    energyNeeded_unit = "MWh";
  } else if (energyNeeded_value < 1) {
    energyNeeded_value *= 1e3;
    energyNeeded_unit = "Wh";
  }

  if ((energyNeeded_value != 0) &
      ((energyNeeded_value >= 1e3) | (energyNeeded_value < 1))) {
    result.textEnergyNeeded = "$energyNeeded_value $energyNeeded_unit";
  } else {
    result.textEnergyNeeded = "$energyNeeded_value $energyNeeded_unit";
  }

  // Text tree-months
  var treeTime_value = result.treeMonths; // in tree-months
  var treeTime_unit = "tree-months";
  if (treeTime_value >= 24) {
    treeTime_value /= 12;
    treeTime_unit = "tree-years";
  }

  // TODO: AJUSTAR
  if ((treeTime_value != 0) &
      ((treeTime_value >= 1e3) | (treeTime_value < 0.1))) {
    result.treeYear = "$treeTime_value $treeTime_unit";
  } else {
    result.treeYear = "$treeTime_value $treeTime_unit";
  }

  return result;
}

import 'package:flutter/material.dart';
import 'package:meu_rastro_carbono/ui/components/surveys/survey_widget.dart';
import 'package:meu_rastro_carbono/ui/widgets/models/surveys/survey_question_model.dart';

import '../../data/datasets/electronic_carbon_emission_dataset.dart';
import '../../data/datasets/food_carbon_emission_dataset.dart';
import '../../data/datasets/water_carbon_emission_dataset.dart';
import '../../data/surveys/electronic_survey.dart';
import '../../data/surveys/food_survey.dart';
import '../../data/surveys/water_survey.dart';

class SurveyPage extends StatefulWidget {
  final String surveyTheme;

  const SurveyPage({super.key, required this.surveyTheme});

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  late List<SurveyQuestionModel> _surveyQuestions = [];
  late Function _onFoodSurveyAnswered;

  String onFoodSurveyAnswered(List<SurveyQuestionModel> survey) {
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

  String onWaterSurveyAnswered(List<SurveyQuestionModel> survey) {
    String showersAmountAnswer = survey[0].userAnswer ?? '0';
    bool usaAguaQuente = survey[1].userAnswer == 'Sim' ? true : false;
    String duracaoBanhoMinutosAnswer = survey[2].userAnswer ?? '0';
    double duracaoBanhoMinutos = double.parse(duracaoBanhoMinutosAnswer);
    String taxaFluxoAguaAnswered = survey[3].userAnswer ?? '0';
    double taxaFluxoAgua = double.parse(taxaFluxoAguaAnswered);
    double showersAmount = double.parse(showersAmountAnswer);

    // double areaCasaMetrosQuadrados = ...;
    // double tamanhoJardimMetrosQuadrados = ...;
    // bool usaAguaLavarRoupa = ...;
    // bool usaAguaLavarLouca = ...;
    // double energiaConsumidaKWh = ...;

    // cálculo da pegada de carbono do banho em kg CO2e
    double consumoAguaBanhoLitros = duracaoBanhoMinutos * taxaFluxoAgua / 1000.0; // taxaFluxoAgua em L/min
    double pegadaCarbonoAguaQuente = usaAguaQuente ? consumoAguaBanhoLitros * EMISSAO_AGUA_QUENTE : 0.0;
    
    double pegadaCarbonoBanhoTratamentoAgua = consumoAguaBanhoLitros * EMISSAO_ENERGIA_TRATAMENTO_AGUA;
    double pegadaCarbonoBanhoTotal = (pegadaCarbonoAguaQuente + pegadaCarbonoBanhoTratamentoAgua) * showersAmount;

    // TODO: CALCULAR GASTO DE ÁGUA COM LOUÇA E LAVAGEM DE ROUPA
    // double pegadaCarbonoEnergiaTratamentoAgua = (consumoAguaBanhoLitros + ) * EMISSAO_ENERGIA_TRATAMENTO_AGUA;
    // double pegadaCarbonoTransporteAgua = consumoAguaDiarioLitros * EMISSAO_TRANSPORTE_AGUA;
    // double pegadaCarbonoLavagemRoupa = usaAguaLavarRoupa ? consumoAguaDiarioLitros * EMISSAO_ENERGIA_TRATAMENTO_AGUA : 0.0;
    // double pegadaCarbonoLavagemLouca = usaAguaLavarLouca ? consumoAguaDiarioLitros * EMISSAO_ENERGIA_TRATAMENTO_AGUA : 0.0;
    // double pegadaCarbonoTotalDiaria = pegadaCarbonoEnergiaTratamentoAgua + pegadaCarbonoTransporteAgua + pegadaCarbonoAguaQuente + pegadaCarbonoLavagemRoupa + pegadaCarbonoLavagemLouca;

    return 'A pegada de carbono diária do uso de água no banho é de ${pegadaCarbonoBanhoTotal} kg CO2e.';
  }

  String onElectronicSurveyAnswered(List<SurveyQuestionModel> survey) {
    String energySource = survey[4].userAnswer ?? 'Eletricidade';
    String phoneUsageAnswer = survey[0].userAnswer ?? '0';
    String computerUsageAnswer = survey[1].userAnswer ?? '0';
    String tvUsageAnswer = survey[2].userAnswer ?? '0';
    String consoleGameAnswer = survey[3].userAnswer ?? '0';

    double phoneUsage = double.parse(phoneUsageAnswer);
    double computerUsage = double.parse(computerUsageAnswer);
    double tvUsage = double.parse(tvUsageAnswer);
    double consoleGameUsage = double.parse(consoleGameAnswer);

    // calculating carbon emission
    double phoneCarbon = 0;
    double computerCarbon = 0;
    double tvCarbon = 0;
    double consoleCarbon = 0;

    if (energySource == 'Eletricidade') {
      phoneCarbon = phoneUsage * ELECTRICITY_EMISSIONS_RATE_PER_KG;
      computerCarbon = computerUsage * ELECTRICITY_EMISSIONS_RATE_PER_KG;
      tvCarbon = tvUsage * ELECTRICITY_EMISSIONS_RATE_PER_KG;
      consoleCarbon = consoleGameUsage * ELECTRICITY_EMISSIONS_RATE_PER_KG;
    } else {
      // battery or solar power
      phoneCarbon = phoneUsage * SOLAR_EMISSIONS_RATE_PER_KG;
      computerCarbon = computerUsage * SOLAR_EMISSIONS_RATE_PER_KG;
      tvCarbon = tvUsage * SOLAR_EMISSIONS_RATE_PER_KG;
      consoleCarbon = consoleGameUsage * SOLAR_EMISSIONS_RATE_PER_KG;
    }

    // Summing up carbon footprints for all devices
    String totalCarbonFootprint =
        (phoneCarbon + computerCarbon + tvCarbon + consoleCarbon)
            .toStringAsFixed(3);

    return 'Você emitiu $totalCarbonFootprint CO2 na atmosfera utilizando dispositivos';
    // TODO: store metric
  }

  @override
  initState() {
    super.initState();
    switch (widget.surveyTheme) {
      case 'alimentos':
        _surveyQuestions = foodSurveyQuestions;
        _onFoodSurveyAnswered = onFoodSurveyAnswered;
        break;
      case 'dispositivos':
        _surveyQuestions = electronicSurveyQuestions;
        _onFoodSurveyAnswered = onElectronicSurveyAnswered;
        break;
      case 'agua':
        _surveyQuestions = waterSurveyQuestions;
        _onFoodSurveyAnswered = onWaterSurveyAnswered;
        break;
      default:
        _surveyQuestions = electronicSurveyQuestions;
        _onFoodSurveyAnswered = onElectronicSurveyAnswered;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meu rastro',
              style: TextStyle(color: Colors.white, fontSize: 26)),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: SurveyWidget(
          surveyQuestions: _surveyQuestions,
          onSurveyAnswered: _onFoodSurveyAnswered,
        ));
  }
}

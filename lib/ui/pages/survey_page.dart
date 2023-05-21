import 'package:flutter/material.dart';
import 'package:meu_rastro_carbono/ui/components/surveys/survey_widget.dart';
import 'package:meu_rastro_carbono/ui/widgets/models/surveys/survey_question_model.dart';

import '../../data/datasets/electronic_carbon_emission_dataset.dart';
import '../../data/datasets/food_carbon_emission_dataset.dart';
import '../../data/surveys/electronic_survey.dart';
import '../../data/surveys/food_survey.dart';
import '../../data/surveys/transportation_survey.dart';
import '../../data/surveys/water_survey.dart';

class SurveyPage extends StatefulWidget {
  final String surveyTheme;

  const SurveyPage({super.key, required this.surveyTheme});

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  late List<SurveyQuestionModel> _surveyQuestions = [];
  late Function _onSurveyAnswered;

  String _pageTitle = 'Meu rastro';

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
        _onSurveyAnswered = mealsFootprintCalculation;
        setState(() {
          _pageTitle = 'Pegada hídrica diária';
        });
        break;

      case 'dispositivos':
        _surveyQuestions = electronicSurveyQuestions;
        _onSurveyAnswered = onElectronicSurveyAnswered;
        setState(() {
          _pageTitle = 'Pegada hídrica diária';
        });
        break;

      case 'agua':
        _surveyQuestions = waterSurveyQuestions;
        _onSurveyAnswered = waterFootprintCalculation;
        setState(() {
          _pageTitle = 'Pegada hídrica diária';
        });
        break;

      case 'transporte':
        _surveyQuestions = transportationSurveyQuestions;
        _onSurveyAnswered = transportationFootprintCalculation;
        setState(() {
          _pageTitle = 'Pegada por transporte diário';
        });
        break;
      default:
        break;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pageTitle,
              style: const TextStyle(color: Colors.white, fontSize: 26)),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: SurveyWidget(
          surveyQuestions: _surveyQuestions,
          onSurveyAnswered: _onSurveyAnswered,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:meu_rastro_carbono/ui/components/surveys/survey_widget.dart';
import 'package:meu_rastro_carbono/ui/widgets/models/surveys/survey_question_model.dart';

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
        _onSurveyAnswered = electricFootprintCalculation;
        setState(() {
          _pageTitle = 'Consumo de energia';
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

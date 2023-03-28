import 'package:flutter/material.dart';
import 'package:meu_rastro_carbono/ui/components/surveys/survey_widget.dart';
import 'package:meu_rastro_carbono/ui/widgets/models/surveys/survey_answer_model.dart';
import 'package:meu_rastro_carbono/ui/widgets/models/surveys/survey_question_model.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final List<SurveyQuestionModel> _surveyQuestions = [
    SurveyQuestionModel(
      question: 'Qual o aparelho eletrônico utilizado?',
      questionType: SurveyQuestionType.option,
      answerOptions: [
        SurveyAnswerModel(answer: 'Celular', imagePath: '', value: 0),
        SurveyAnswerModel(answer: 'Computador', imagePath: '', value: 1),
        SurveyAnswerModel(answer: 'Tablet', imagePath: '', value: 2),
        SurveyAnswerModel(answer: 'TV', imagePath: '', value: 3),
      ],
      answerPrefix: '',
      answerSuffix: ''
    ),
    SurveyQuestionModel(
      question: 'Qual a marca do dispositivo?',
      questionType: SurveyQuestionType.anyText,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: ''
    ),
    SurveyQuestionModel(
      question: 'Qual o modelo do dispositivo?',
      questionType: SurveyQuestionType.anyText,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: ''
    ),
    SurveyQuestionModel(
      question: 'O equipamento foi utilizado por',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: 'minutos'
    ),
    SurveyQuestionModel(
      question: 'Qual foi a fonte de energia utilizada?',
      questionType: SurveyQuestionType.option,
      answerOptions: [
        SurveyAnswerModel(answer: 'Eletricidade', imagePath: '', value: 0),
        SurveyAnswerModel(answer: 'Energia Solar', imagePath: '', value: 1),
        SurveyAnswerModel(answer: 'Bateria', imagePath: '', value: 2),
      ],
      answerPrefix: '',
      answerSuffix: ''
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu rastro',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SurveyWidget(surveyQuestions: _surveyQuestions,)
    );
  }
}

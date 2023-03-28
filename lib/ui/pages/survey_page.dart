import 'package:flutter/material.dart';
import 'package:meu_rastro_carbono/ui/widgets/models/surveys/survey_answer_model.dart';
import 'package:meu_rastro_carbono/ui/widgets/models/surveys/survey_question_model.dart';

import '../components/surveys/survey_question_widget.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  int _currentPageIndex = 0;
  final List<SurveyQuestionModel> _surveyQuestions = [
    SurveyQuestionModel(
      question: 'How often do you recycle?',
      answers: [
        SurveyAnswerModel(answer: 'Always', value: 3),
        SurveyAnswerModel(answer: 'Sometimes', value: 2),
        SurveyAnswerModel(answer: 'Rarely', value: 1),
        SurveyAnswerModel(answer: 'Never', value: 0),
      ],
    ),
    SurveyQuestionModel(
      question: 'Do you use reusable bags when shopping?',
      answers: [
        SurveyAnswerModel(answer: 'Always', value: 3),
        SurveyAnswerModel(answer: 'Sometimes', value: 2),
        SurveyAnswerModel(answer: 'Rarely', value: 1),
        SurveyAnswerModel(answer: 'Never', value: 0),
      ],
    ),
    SurveyQuestionModel(
      question: 'Do you use public transportation?',
      answers: [
        SurveyAnswerModel(answer: 'Always', value: 3),
        SurveyAnswerModel(answer: 'Sometimes', value: 2),
        SurveyAnswerModel(answer: 'Rarely', value: 1),
        SurveyAnswerModel(answer: 'Never', value: 0),
      ],
    ),
    SurveyQuestionModel(
      question: 'Do you turn off lights when leaving a room?',
      answers: [
        SurveyAnswerModel(answer: 'Always', value: 3),
        SurveyAnswerModel(answer: 'Sometimes', value: 2),
        SurveyAnswerModel(answer: 'Rarely', value: 1),
        SurveyAnswerModel(answer: 'Never', value: 0),
      ],
    ),
  ];
  void _goToNextPage(context) {
    setState(() {
      if (_currentPageIndex < _surveyQuestions.length - 1) {
        _currentPageIndex++;
      } else {
        showAnswerSurveyDialog(context);
      }
    });
  }

  void showAnswerSurveyDialog(context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Obrigada por informar!',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('lib/ui/assets/images/leaf.png'),
              width: 115,
            ),
            const SizedBox(height: 15),
            Text(
              'Vou analisar suas respostas e te informar o tamanho da sua pegada de carbono, bem como recomendações de como minimizá-lá!',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _goToPreviousPage() {
    setState(() {
      if (_currentPageIndex > 0) {
        _currentPageIndex--;
      }
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              // height: 200,
              child: Stepper(
                elevation: 0,
                currentStep: _currentPageIndex,
                controlsBuilder: (context, controller) {
                  return const SizedBox.shrink();
                },
                // onStepContinue: _goToNextPage,
                type: StepperType.horizontal,
                steps: List.generate(
                  _surveyQuestions.length,
                  (index) => Step(
                    title: const Text(''),
                    isActive: _currentPageIndex >= index,
                    content: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: SurveyQuestionWidget(
                            question: _surveyQuestions[_currentPageIndex],
                            onAnswered: () {
                              print('respondido');
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: _currentPageIndex > 0,
                    child: FloatingActionButton(
                      heroTag: 'btn_previous_page',
                      onPressed: _goToPreviousPage,
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: 'btn_next_page',
                    onPressed: () => _goToNextPage(context),
                    child: Icon(_currentPageIndex < _surveyQuestions.length - 1
                        ? Icons.arrow_forward
                        : Icons.check),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/ui/components/surveys/questions/question_food_consumption_widget.dart';
import 'package:meu_rastro_carbono/ui/components/surveys/questions/question_text_image_type_widget.dart';
import 'package:meu_rastro_carbono/ui/components/surveys/questions/question_turnon_lamps_widget.dart';
import 'package:meu_rastro_carbono/ui/components/surveys/questions/question_yes_or_no_type_widget.dart';
import '../../../data/datasets/food/menu_dataset.dart';
import '../../widgets/models/surveys/survey_question_model.dart';
import 'questions/question_any_text_type_widget.dart';
import 'questions/question_options_type_widget.dart';

class SurveyWidget extends StatefulWidget {
  final List<SurveyQuestionModel> surveyQuestions;
  final Function onSurveyAnswered;
  final DateTime answerDatetime;

  const SurveyWidget(
      {super.key,
      required this.surveyQuestions,
      required this.onSurveyAnswered,
      required this.answerDatetime});

  @override
  _SurveyWidgetState createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget> {
  int _currentPageIndex = 0;
  List<SurveyQuestionModel> surveyWithAnswers = [];

  @override
  initState() {
    super.initState();
    surveyWithAnswers = widget.surveyQuestions;
  }

  void _updateSurveyState(int index, String response) {
    var survey = surveyWithAnswers;
    survey[index].userAnswer = response;
    setState(() {
      // surveyWithAnswers:
      survey;
    });
  }

  bool _skipQuestionValidation() {
    if (widget.surveyQuestions[_currentPageIndex].skipQuestion != null) {
      bool skipQuestion = widget.surveyQuestions[_currentPageIndex].skipQuestion!(widget.surveyQuestions);
      return skipQuestion;
    }
    return false;
  }

  void _goToNextPage(context) {
    setState(() {
      if (_currentPageIndex < widget.surveyQuestions.length - 1) {
        _currentPageIndex++;
        if (_skipQuestionValidation()) {
          _goToNextPage(context);
        }
      } else {
        showAnswerSurveyDialog(context);
      }
    });
  }

  void _goToPreviousPage() {
    setState(() {
      if (_currentPageIndex > 0) {
        _currentPageIndex--;
        if (_skipQuestionValidation()) {
          _goToPreviousPage();
        }
      }
    });
  }

  void showAnswerSurveyDialog(context) async {
    var calculationResponse = await widget.onSurveyAnswered(surveyWithAnswers, widget.answerDatetime);

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
          children: [
            Text(calculationResponse,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            const Image(
              image: AssetImage('lib/ui/assets/images/leaf.png'),
              width: 115,
            ),
            const SizedBox(height: 15),
            Text(
              'Com base em seu consumo vou te dar dicas de como reduzir sua pegada de carbono!',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Modular.to.pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  _surveyQuestionTemplate(SurveyQuestionType type) {
    switch (type) {
      case SurveyQuestionType.option:
        return QuestionOptionTypeWidget(
          question: widget.surveyQuestions[_currentPageIndex],
          onAnswered: (String answer) {
            _updateSurveyState(_currentPageIndex, answer);
          },
        );
      case SurveyQuestionType.anyText || SurveyQuestionType.anyNumber:
        return QuestionAnyTextTypeWidget(
          question: widget.surveyQuestions[_currentPageIndex],
          onAnswered: (String answer) {
            _updateSurveyState(_currentPageIndex, answer);
          },
        );
      case SurveyQuestionType.textAndImage:
        return QuestionTextImageTypeWidget(
          question: widget.surveyQuestions[_currentPageIndex],
          onAnswered: (String answer) {
            _updateSurveyState(_currentPageIndex, answer);
          },
        );
      case SurveyQuestionType.turnOnLamps:
        return TurnOnLampsWidget(
          question: widget.surveyQuestions[_currentPageIndex],
          onAnswered: (String answer) {
            _updateSurveyState(_currentPageIndex, answer);
          },
        );
      case SurveyQuestionType.yesOrNo:
        return QuestionYesOrNoTypeWidget(
          question: widget.surveyQuestions[_currentPageIndex],
          onAnswered: (String answer) {
            _updateSurveyState(_currentPageIndex, answer);
          },
        );
      case SurveyQuestionType.yesOrNo:
        return QuestionYesOrNoTypeWidget(
          question: widget.surveyQuestions[_currentPageIndex],
          onAnswered: (String answer) {
            _updateSurveyState(_currentPageIndex, answer);
          },
        );
      case SurveyQuestionType.foodConsumption:
        return QuestionFoodConsumption(
          menu: mealsDataset,
          question: widget.surveyQuestions[_currentPageIndex],
          onAnswered: (String answer) {
            _updateSurveyState(_currentPageIndex, answer);
          },
        );
      default:
        return Container(
          color: Colors.red,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            // height: 200,
            child: Stepper(
              elevation: 0,
              currentStep: _currentPageIndex,
              onStepTapped: (step){},
              controlsBuilder: (context, controller) {
                return const SizedBox.shrink();
              },
              // onStepContinue: _goToNextPage,
              type: StepperType.horizontal,
              steps: List.generate(
                widget.surveyQuestions.length,
                (index) => Step(
                  title: const Text(''),
                  isActive: _currentPageIndex >= index,
                  content: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: _surveyQuestionTemplate(widget
                            .surveyQuestions[_currentPageIndex].questionType),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
      padding: const EdgeInsets.all(16),
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
                  child: Icon(
                      _currentPageIndex < widget.surveyQuestions.length - 1
                          ? Icons.arrow_forward
                          : Icons.check),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../widgets/models/surveys/survey_question_model.dart';
import 'questions/question_any_text_type_widget.dart';
import 'questions/question_options_type_widget.dart';

class SurveyWidget extends StatefulWidget {
  final List<SurveyQuestionModel> surveyQuestions;

  const SurveyWidget({super.key, required this.surveyQuestions});

  @override
  _SurveyWidgetState createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget> {
  int _currentPageIndex = 0;

  void _goToNextPage(context) {
    setState(() {
      if (_currentPageIndex < widget.surveyQuestions.length - 1) {
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

  void _goToPreviousPage() {
    setState(() {
      if (_currentPageIndex > 0) {
        _currentPageIndex--;
      }
    });
  }

  _surveyQuestionTemplate(SurveyQuestionType type) {
    switch (type) {
      case SurveyQuestionType.option:
        return QuestionOptionTypeWidget(
          question: widget.surveyQuestions[_currentPageIndex],
          onAnswered: () {
            var history = Modular.to.navigateHistory;
            print('respondido');
          },
        );
      case SurveyQuestionType.anyText || SurveyQuestionType.anyNumber:
        return QuestionAnyTextTypeWidget(
          question: widget.surveyQuestions[_currentPageIndex],
          onAnswered: () {
            print('respondido');
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
                widget.surveyQuestions.length,
                (index) => Step(
                  title: const Text(''),
                  isActive: _currentPageIndex >= index,
                  content: Row(
                    children: [
                      Expanded(
                        flex: 5,
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
            ),
          ),
        ],
      ),
    );
  }
}

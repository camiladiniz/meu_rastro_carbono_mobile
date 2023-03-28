import 'package:flutter/material.dart';
import '../../../widgets/models/surveys/survey_question_model.dart';

class QuestionOptionTypeWidget extends StatefulWidget {
  final SurveyQuestionModel question;
  final Function onAnswered;

  const QuestionOptionTypeWidget(
      {super.key, required this.question, required this.onAnswered});

  @override
  _QuestionOptionTypeWidgetState createState() =>
      _QuestionOptionTypeWidgetState();
}

class _QuestionOptionTypeWidgetState extends State<QuestionOptionTypeWidget> {
  String? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question.question,
          style: const TextStyle(fontSize: 23.0),
        ),
        const SizedBox(height: 16.0),
        ..._buildAnswerButtons(),
        const SizedBox(height: 16.0),
        // if (_selectedAnswer != null)
        //   Text(
        //     'You selected: $_selectedAnswer',
        //     style: const TextStyle(fontSize: 16.0),
        //   ),
      ],
    );
  }

  List<Widget> _buildAnswerButtons() {
    List<Widget> buttons = [];
    for (int i = 0; i < widget.question.answerOptions.length; i++) {
      String answer = widget.question.answerOptions[i].answer;
      buttons.add(Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedAnswer = answer;
              });
              widget.onAnswered();
            },
            child: Text(answer),
            style: _selectedAnswer == answer
                ? ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(200, 42)),
                  )
                : ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(200, 42)),
                  ),
          ),
        ),
      ));
    }
    return buttons;
  }
}

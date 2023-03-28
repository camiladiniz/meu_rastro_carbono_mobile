import 'package:flutter/material.dart';
import '../../widgets/models/surveys/survey_question_model.dart';

class SurveyQuestionWidget extends StatefulWidget {
  final SurveyQuestionModel question;
  final Function onAnswered;

  const SurveyQuestionWidget({super.key, required this.question, required this.onAnswered});

  @override
  _SurveyQuestionWidgetState createState() => _SurveyQuestionWidgetState();
}
class _SurveyQuestionWidgetState extends State<SurveyQuestionWidget> {
  String? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question.question,
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 16.0),
        ..._buildAnswerButtons(),
        const SizedBox(height: 16.0),
        if (_selectedAnswer != null)
          Text(
            'You selected: $_selectedAnswer',
            style: const TextStyle(fontSize: 16.0),
          ),
      ],
    );
  }
  List<Widget> _buildAnswerButtons() {
    List<Widget> buttons = [];
    for (int i = 0; i < widget.question.answers.length; i++) {
      String answer = widget.question.answers[i].answer;
      buttons.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedAnswer = answer;
              });
              widget.onAnswered();
            },
            child: Text(answer),
          ),
        ),
      );
    }
    return buttons;
  }
}

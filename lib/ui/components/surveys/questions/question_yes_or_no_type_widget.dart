import 'package:flutter/material.dart';
import '../../../widgets/models/surveys/survey_question_model.dart';

class QuestionYesOrNoTypeWidget extends StatefulWidget {
  final SurveyQuestionModel question;
  final Function onAnswered;

  const QuestionYesOrNoTypeWidget(
      {super.key, required this.question, required this.onAnswered});

  @override
  _QuestionYesOrNoTypeWidgetState createState() =>
      _QuestionYesOrNoTypeWidgetState();
}

class _QuestionYesOrNoTypeWidgetState extends State<QuestionYesOrNoTypeWidget> {
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
        _buildRadioButtons()
      ],
    );
  }

  Widget _buildRadioButtons() {
    return Center(
      child: Column(children: [
        ListTile(
          title: const Text('Sim'),
          leading: Radio(
            value: QuestionTypeYesOrNo.yes,
            groupValue: _selectedAnswer,
            onChanged: (value) {
              setState(() {
                _selectedAnswer = value.toString();
                widget.onAnswered(_selectedAnswer);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Não'),
          leading: Radio(
            value: QuestionTypeYesOrNo.no,
            groupValue: _selectedAnswer,
            onChanged: (value) {
              setState(() {
                _selectedAnswer = value.toString();
                widget.onAnswered(_selectedAnswer);
              });
            },
          ),
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../widgets/models/surveys/survey_question_model.dart';

class QuestionFoodConsumption extends StatefulWidget {
  final SurveyQuestionModel question;
  final Function onAnswered;

  const QuestionFoodConsumption(
      {super.key, required this.question, required this.onAnswered});

  @override
  _QuestionFoodConsumptionState createState() =>
      _QuestionFoodConsumptionState();
}

class _QuestionFoodConsumptionState extends State<QuestionFoodConsumption> {
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

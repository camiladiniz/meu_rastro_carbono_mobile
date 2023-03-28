import 'package:flutter/material.dart';
import '../../../widgets/models/surveys/survey_question_model.dart';

class QuestionAnyTextTypeWidget extends StatefulWidget {
  final SurveyQuestionModel question;
  final Function onAnswered;

  const QuestionAnyTextTypeWidget(
      {super.key, required this.question, required this.onAnswered});

  @override
  _QuestionAnyTextTypeWidgetState createState() =>
      _QuestionAnyTextTypeWidgetState();
}

class _QuestionAnyTextTypeWidgetState extends State<QuestionAnyTextTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.question.question,
          style: const TextStyle(fontSize: 23.0),
        ),
        const SizedBox(height: 24.0),
        TextFormField(
          keyboardType:
              widget.question.questionType == SurveyQuestionType.anyNumber
                  ? TextInputType.number
                  : TextInputType.text,
          decoration: const InputDecoration(
            hintText: 'Informe aqui',
          ),
          // onChanged: (value) => _surveyAnswers[index] = value,
        ),
        Text(
          widget.question.answerSuffix,
          style: const TextStyle(fontSize: 21.0),
        ),
      ],
    );
  }
}

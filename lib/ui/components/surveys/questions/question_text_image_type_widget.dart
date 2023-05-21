import 'package:flutter/material.dart';
import 'package:select_card/select_card.dart';
import '../../../widgets/models/surveys/survey_question_model.dart';

class QuestionTextImageTypeWidget extends StatefulWidget {
  final SurveyQuestionModel question;
  final Function onAnswered;

  const QuestionTextImageTypeWidget(
      {super.key, required this.question, required this.onAnswered});

  @override
  _QuestionTextImageTypeWidgetState createState() =>
      _QuestionTextImageTypeWidgetState();
}

class _QuestionTextImageTypeWidgetState
    extends State<QuestionTextImageTypeWidget> {
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
        const SizedBox(height: 12.0),
        Text(
            _selectedAnswer ?? "",
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 12.0),
        SelectGroupCard(context,
            titles: widget.question.answerOptions
                .map((answer) => answer.answer)
                .toList(),
            imageSourceType: ImageSourceType.asset,
            images: widget.question.answerOptions
                .map((answer) => answer.imagePath)
                .toList(),
            cardBackgroundColor: const Color.fromARGB(255, 169, 235, 128),
            cardSelectedColor: const Color.fromRGBO(19, 230, 0, 1),
            titleTextColor: const Color.fromRGBO(2, 26, 0, 1),
            contentTextColor: Colors.black87, onTap: (answer) {
          setState(() {
                  _selectedAnswer = answer;
                });
                widget.onAnswered(_selectedAnswer);
        }),
        const SizedBox(height: 16.0),
      ],
    );
  }
}

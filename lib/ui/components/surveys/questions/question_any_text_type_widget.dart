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
    String questionDescription = widget.question.description ?? '';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.question.question,
          style: const TextStyle(fontSize: 23.0),
        ),
        const SizedBox(height: 24.0),
        TextFormField(
          onChanged: (text) {
            widget.onAnswered(text);
          },
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
        questionDescription != ''
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                    child: Icon(
                      Icons.info,
                      color: Theme.of(context).primaryColor,
                      size: 21,
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                            child: Container(
                              height: 200.0,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Center(
                                  child: Text(questionDescription,
                                      style: const TextStyle(fontSize: 18.0)),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }))
            : Container(
                width: 29,
              )
      ],
    );
  }
}

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
      String answerDescription = widget.question.answerOptions[i].description ?? '';
      buttons.add(Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedAnswer = answer;
                });
                widget.onAnswered(_selectedAnswer);
              },
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
              child: Text(answer),
            ),
            answerDescription != '' ? Padding(
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
                            child: Center(
                              child: Text(
                                  answerDescription,
                                  style: const TextStyle(fontSize: 18.0)),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ))
                :
                Container(width: 29,)
            
          ],
        ),
      ));
    }
    return buttons;
  }
}

import 'package:flutter/material.dart';
import '../../../widgets/models/surveys/electricity/lamp_data_model.dart';
import '../../../widgets/models/surveys/survey_question_model.dart';

class TurnOnLampsWidget extends StatefulWidget {
  final SurveyQuestionModel question;
  final Function onAnswered;

  const TurnOnLampsWidget(
      {super.key, required this.question, required this.onAnswered});

  @override
  _TurnOnLampsWidgetState createState() => _TurnOnLampsWidgetState();
}

class _TurnOnLampsWidgetState extends State<TurnOnLampsWidget> {

  List<LampData> lampsData =
      List.generate(9, (index) => LampData(isOn: false, operationTime: 0.0));

  var rooms = [
    'Lâmpada sala',
    'Lâmpada cozinha',
    'Lâmpada banheiro',
    'Lâmpada quarto 1',
    'Lâmpada quarto 2',
    'Lâmpada quarto 3',
    'Lâmpada serviços',
    'Lâmpada jardim',
    'Lâmpada garagem',
  ];

  updateWidgetAnswer() {
    var operationTime = "";
    for (var l in lampsData) {
      if(l.operationTime > 0.0) {
        if(operationTime != "") {
          operationTime += ",";
        }
        operationTime += l.operationTime.toString();
      }
    }
    widget.onAnswered(operationTime);
  }

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
        GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: lampsData.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        lampsData[index].isOn = !lampsData[index].isOn;
                        lampsData[index].operationTime = 0.0;
                      });
                      updateWidgetAnswer();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: lampsData[index].isOn
                            ? Colors.yellow
                            : Colors.grey[300],
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.lightbulb,
                          color: Colors.white,
                        ),
                        Expanded(
                            child: Text(
                          rooms[index],
                          style: const TextStyle(color: Colors.white),
                        )),
                      ],
                    )),
                const SizedBox(height: 8.0),
                TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: false),
                  style: const TextStyle(
                    fontSize: 12,
                    // fontWeight: FontWeight.normal,
                    // color: greyColor,
                  ),
                  onChanged: (value) {
                    setState(() {
                      lampsData[index].operationTime = double.parse(value);
                    });
                    updateWidgetAnswer();
                  },
                  decoration: InputDecoration(
                    labelText: 'Uso em horas',
                    enabled: lampsData[index].isOn == true,
                    labelStyle: const TextStyle(fontSize: 15),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

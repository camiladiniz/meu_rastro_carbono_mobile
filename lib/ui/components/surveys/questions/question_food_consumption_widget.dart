import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../../data/models/food/meal_model.dart';
import '../../../widgets/models/surveys/survey_question_model.dart';

class QuestionFoodConsumption extends StatefulWidget {
  final SurveyQuestionModel question;
  final Function onAnswered;
  final List<MealModel> menu;

  const QuestionFoodConsumption(
      {super.key,
      required this.question,
      required this.onAnswered,
      required this.menu});

  @override
  _QuestionFoodConsumptionState createState() =>
      _QuestionFoodConsumptionState();
}

class _QuestionFoodConsumptionState extends State<QuestionFoodConsumption> {
  List<MealModel> menuState = [];

  @override
  initState() {
    super.initState();
    menuState = widget.menu;
  }

  void _alterarPorcao(int mealTypeIndex, int mealIndex, bool aumentarPorcao) {
    var menuTemp = menuState;
    if (aumentarPorcao) {
      menuTemp[mealTypeIndex].mealOptions[mealIndex].userPortionAmount++;
    } else {
      if (menuTemp[mealTypeIndex].mealOptions[mealIndex].userPortionAmount ==
          0) {
        return;
      }
      menuTemp[mealTypeIndex].mealOptions[mealIndex].userPortionAmount--;
    }
    setState(() {
      menuState = menuTemp;
    });
    widget.onAnswered(json.encode(menuTemp));
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
        const SizedBox(height: 16.0),
        _buildFoodOptions()
      ],
    );
  }

  Widget _buildFoodOptions() {
    return Column(children: [
      for (int mealTypeIndex = 0;
          mealTypeIndex < widget.menu.length;
          mealTypeIndex++)
        _buildRefeicaoCategory(widget.menu[mealTypeIndex].title, [
          for (int mealIndex = 0; mealIndex < widget.menu[mealTypeIndex].mealOptions.length; mealIndex++)
            _buildCardapioBox(
                'lib/ui/assets/images/food/food.png',
                widget.menu[mealTypeIndex].mealOptions[mealIndex].name,
                '${widget.menu[mealTypeIndex].mealOptions[mealIndex].userPortionAmount * widget.menu[mealTypeIndex].mealOptions[mealIndex].portionSize} ${widget.menu[mealTypeIndex].mealOptions[mealIndex].portionUnit}',
                mealTypeIndex, mealIndex)
        ])
    ]);
  }

  Widget _buildRefeicaoCategory(String titulo, List<Widget> alimentos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            titulo,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: alimentos.length,
            itemBuilder: (BuildContext context, int index) {
              return alimentos[index];
            },
          ),
        ),
        const Divider(height: 15, thickness: 2),
      ],
    );
  }

  Widget _buildCardapioBox(String imagePath, String nomeAlimento, String porcao, int mealTypeIndex, mealIndex) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 100,
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(171, 201, 87, 0.8),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.remove),
                    color: Colors.white,
                    onPressed: () => _alterarPorcao(mealTypeIndex, mealIndex, false),
                  ),
                ),
                Container(
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(171, 201, 87, 0.8),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.white,
                    onPressed: () => _alterarPorcao(mealTypeIndex, mealIndex, true),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 3),
            child: Text(
              nomeAlimento,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Text(porcao),
        ],
      ),
    );
  }
}

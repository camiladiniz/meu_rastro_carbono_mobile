import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/ui/widgets/cards/survey_item_card.dart';

import '../widgets/models/menu_navigate_item_model.dart';

class SurveysPage extends StatelessWidget {
  SurveysPage({super.key});

  final List<CardItemModel> categories = [
    CardItemModel(
        title: 'Alimentação',
        icon: Icons.food_bank,
        color: Colors.pink,
        onTap: () => {Modular.to.pushNamed('/survey')},
        status: SurveyStatus.answered),
    CardItemModel(
        title: 'Eletrônicos',
        icon: Icons.devices,
        color: Colors.blue,
        onTap: () => {},
        status: SurveyStatus.pending),
    CardItemModel(
        title: 'Locomoção',        
        icon: Icons.directions_train,
        color: Colors.purple,
        onTap: () => {},
        status: SurveyStatus.pending),
    CardItemModel(
        title: 'Energia elétrica',        
        icon: Icons.lightbulb,
        color: Colors.indigo,
        onTap: () => {},
        status: SurveyStatus.answered),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const Row(
            children: [
              Image(
                image: AssetImage('lib/ui/assets/images/leaf.png'),
                width: 115,
              ),
              Flexible(
                child: Text(
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    // color: Colors.black54,
                  ),
                  "Para ajudá-lo a reduzir sua pegada de carbono, preciso entender sua atual emissão de carbono. Vamos lá?",
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          for (var chunk in _chunkedItems(categories, 2))
            Row(
              children: [
                Expanded(
                  child: SurveyItemCard(
                    title: chunk[0].title,
                    icon: chunk[0].icon,
                    color: chunk[0].color,
                    status: chunk[0].status,
                    onTap: chunk[0].onTap
                  ),
                ),
                Expanded(
                  child: SurveyItemCard(
                    title: chunk[1].title,
                    icon: chunk[1].icon,
                    color: chunk[1].color,
                    status: chunk[1].status,
                    onTap: chunk[1].onTap
                  ),
                ),
              ],
            ),
        ]),
      ),
    );
  }
}

List<List<T>> _chunkedItems<T>(List<T> list, int chunkSize) {
  return List.generate(
    (list.length / chunkSize).ceil(),
    (i) => list.sublist(i * chunkSize, (i + 1) * chunkSize),
  );
}

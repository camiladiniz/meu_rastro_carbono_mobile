import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/ui/widgets/cards/survey_item_card.dart';

import '../widgets/models/menu_navigate_item_model.dart';

class SurveysPage extends StatelessWidget {
  SurveysPage({super.key});

  final List<CardItemModel> categories = [
    CardItemModel(
        title: 'Sustainability',
        subtitle: 'Learn how to help our planet',
        icon: Icons.eco,
        color: Colors.green,
        onTap: () => {},
        status: SurveyStatus.answered),
    CardItemModel(
        title: 'Alimentação',
        subtitle: 'Improve your health and wellbeing',
        icon: Icons.food_bank,
        color: Colors.pink,
        onTap: () => {},
        status: SurveyStatus.answered),
    CardItemModel(
        title: 'Eletrônicos',
        subtitle: 'Expand your knowledge',
        icon: Icons.devices,
        color: Colors.blue,
        onTap: () => {},
        status: SurveyStatus.pending),
    CardItemModel(
        title: 'Locomoção',
        subtitle: 'Explore the latest trends',
        icon: Icons.directions_train,
        color: Colors.purple,
        onTap: () => {},
        status: SurveyStatus.pending),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          for (var chunk in _chunkedItems(categories, 2))
            Row(
              children: [
                Expanded(
                  child: SurveyItemCard(
                    title: chunk[0].title,
                    icon: chunk[0].icon,
                    color: chunk[0].color,
                    status: chunk[0].status,
                  ),
                ),
                Expanded(
                  child: SurveyItemCard(
                    title: chunk[1].title,
                    icon: chunk[1].icon,
                    color: chunk[1].color,
                    status: chunk[1].status,
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

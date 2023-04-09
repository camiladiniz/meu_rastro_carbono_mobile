import 'package:flutter/material.dart';
import 'package:meu_rastro_carbono/data/models/evolution/badge_model.dart';
import 'package:meu_rastro_carbono/data/models/evolution/level_model.dart';
import 'package:meu_rastro_carbono/ui/widgets/menu/levels_widget.dart';

class RewardsWidget extends StatelessWidget {
  final List<BadgeModel> locomotionBadges = [
    BadgeModel(
      title: 'Transporte público',
      description: 'Utilizou meios de transporte públicos 3 vezes consecutivas',
      icon: Icons.directions_train,
      color: Colors.pink,
    ),
    BadgeModel(
      title: 'Caminhada',
      description: 'Caminhou por no mínimo 2 vezes na semana',
      icon: Icons.directions_train,
      color: Colors.pink,
    ),
    BadgeModel(
      title: 'Rodízio ecológico',
      description: 'Não utilizou carro por 2 semanas consecutivas',
      icon: Icons.directions_train,
      color: Colors.pink,
    ),
  ];

  final List<LevelModel> levels = [
    LevelModel(
        title: 'Preparando o solo',
        pontuation: 0,
        number: '1',
        imagePath: 'lib/ui/assets/images/leaf.png',
        color: Colors.blue[100]!,
        isAvailable: true),
    LevelModel(
        title: 'Plantando a sementinha',
        pontuation: 0,
        number: '2',
        imagePath: 'lib/ui/assets/images/leaf_02.png',
        color: Colors.orange[100]!,
        isAvailable: true),
    LevelModel(
        title: 'Regando as sementes',
        pontuation: 0,
        number: '3',
        imagePath: 'lib/ui/assets/images/leaf_03.png',
        color: Colors.teal[100]!,
        isAvailable: true),
    LevelModel(
        title: 'Adicionando adubo',
        pontuation: 0,
        number: '4',
        imagePath: 'lib/ui/assets/images/leaf_04.png',
        color: Colors.blue[100]!,
        isAvailable: false),
    LevelModel(
        title: 'Cuidando do brotinho',
        pontuation: 0,
        number: '5',
        imagePath: 'lib/ui/assets/images/leaf_05.png',
        color: Colors.blue[100]!,
        isAvailable: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 300,
          child: GridView.count(
            childAspectRatio: (MediaQuery.of(context).size.width / 300),
            crossAxisCount: 2,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: List.generate(levels.length, (index) {
              final level = levels[index];
              return LevelsWidget(level.imagePath, level.number, level.title,
                  level.color, level.isAvailable);
            }),
          ),
        ),
        const Divider(thickness: 1),
        Text('Conquistas', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(
            // height: MediaQuery.of(context).size.height - (510 + kToolbarHeight),
            height: 180,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < locomotionBadges.length; i++)
                    SizedBox(
                      height: 80,
                      child: ListTile(
                        leading: Icon(
                          locomotionBadges[i].icon,
                          color: locomotionBadges[i].color,
                        ),
                        title: Text(locomotionBadges[i].title,
                            style: Theme.of(context).textTheme.titleSmall),
                        subtitle: Text(locomotionBadges[i].description,
                            style: Theme.of(context).textTheme.bodySmall),
                        dense: true,
                      ),
                    )
                ],
              ),
            ))
      ],
    );
  }
}

class BadgeWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final bool isComplete;

  BadgeWidget({
    required this.text,
    required this.backgroundColor,
    required this.isComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        child: Column(
          children: [
            Text(text),
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: isComplete ? backgroundColor : Colors.grey[300],
                shape: BoxShape.circle,
                border: Border.all(
                  color: isComplete ? Colors.white : Colors.grey,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  '',
                  style: TextStyle(
                    color: isComplete ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Icon(
              isComplete ? Icons.done : Icons.pending,
              color: isComplete ? Colors.green : Colors.orange,
            ),
            // Text(
            //   isComplete ? 'Completo' : '-',
            //   style: TextStyle(
            //     color: isComplete ? Colors.green : Colors.red,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ));
  }
}

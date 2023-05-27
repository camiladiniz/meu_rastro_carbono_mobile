import 'package:flutter/material.dart';

import 'package:meu_rastro_carbono/data/models/evolution/badge_model.dart';

class ProfilePage extends StatelessWidget {
    final List<BadgeModel> locomotionBadges = [
    BadgeModel(
      title: 'Transporte público',
      description: 'Utilizou meios de transporte públicos 3 vezes consecutivas',
      icon: Icons.directions_train,
      color: Colors.purple,
    ),
    BadgeModel(
      title: 'Caminhada',
      description: 'Caminhou o invés de usar veículo privado por no mínimo 2 vezes na semana',
      icon: Icons.directions_train,
      color: Colors.purple,
    ),
    BadgeModel(
      title: 'Rodízio ecológico',
      description: 'Não utilizou carro por 2 semanas consecutivas',
      icon: Icons.directions_train,
      color: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

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

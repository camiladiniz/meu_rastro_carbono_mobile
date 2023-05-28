import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/models/evolution/badge_model.dart';
import '../../data/models/evolution/level_model.dart';
import '../../stores/user_controller.dart';
import '../widgets/menu/levels_widget.dart';

class ProfilePage extends StatelessWidget {
  final UserController userController = Modular.get<UserController>();

  TextStyle _style() {
    return TextStyle(fontWeight: FontWeight.bold);
  }

  final List<BadgeModel> locomotionBadges = [
    BadgeModel(
      title: 'Transporte público',
      description: 'Utilizou meios de transporte públicos 3 vezes consecutivas',
      icon: Icons.directions_train,
      color: Colors.purple,
    ),
    BadgeModel(
      title: 'Caminhada',
      description:
          'Caminhou o invés de usar veículo privado por no mínimo 2 vezes na semana',
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

  final level = LevelModel(
      title: 'Preparando o solo',
      number: '1',
      imagePath: 'lib/ui/assets/images/leaf_05.png',
      color: Colors.blue[100]!,
      isAvailable: true);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: const EdgeInsets.only(top: 4),
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(
                            width: 100,
                            height: 125,
                            child: LevelsWidget(
                                level.imagePath,
                                level.number,
                                level.title,
                                level.color,
                                level.isAvailable,
                                level.userPontuationPercentage,
                                true),
                          ),
                          Text(userController.name,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
                ],
              ),
            ),
          ),
          Text('Conquistas', style: Theme.of(context).textTheme.titleMedium),
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
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();

    p.lineTo(0, size.height - 70);
    p.lineTo(size.width, size.height);

    p.lineTo(size.width, 0);

    p.close();

    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/data/models/evolution/level_model.dart';
import 'package:meu_rastro_carbono/ui/widgets/menu/levels_widget.dart';

import '../../data/datasets/levels_dataset.dart';
import '../../stores/user_evolution_controller.dart';

class RewardsWidget extends StatefulWidget {
  _RewardsWidgetState createState() => _RewardsWidgetState();
}

class _RewardsWidgetState extends State<RewardsWidget> {
  final UserEvolutionController evolutionCtrl =
      Modular.get<UserEvolutionController>();

  final List<LevelModel> levels = getLevels();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserEvolutionPontuation();
  }

  Future<void> getUserEvolutionPontuation() async {
    await evolutionCtrl.initializeSharedPreferences();
    var pontuation = await evolutionCtrl.getUserElovutionPoints();
    var pontuationTemp = pontuation;

    int n0 = 5;
    int n = n0;

    for (int i = 0; i <= levels.length; i++) {
      int nextNumber = n + (n.abs() ~/ 2);
      levels[i].pontuationToBeReached = nextNumber;

      if (pontuationTemp == 0) {
        break;
      }

      if (nextNumber <= pontuationTemp) {
        pontuationTemp = pontuationTemp - nextNumber;
        levels[i].userPontuationPercentage =
            getLevelProgressInPercentage(nextNumber, nextNumber);
      } else {
        levels[i].userPontuationPercentage =
            getLevelProgressInPercentage(pontuationTemp, nextNumber);
        pontuationTemp = 0;
      }
      n = nextNumber;
      levels[i].isAvailable = true;
    }
    setState(() {
      levels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: levels.length,
      itemBuilder: (context, index) {
        final level = levels[index];
        return LevelsWidget(level.imagePath, level.number, level.title,
            level.color, level.isAvailable, level.userPontuationPercentage, false);
      },
    );
  }
}

class BadgeWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final bool isComplete;

  const BadgeWidget({
    super.key,
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
          ],
        ));
  }
}

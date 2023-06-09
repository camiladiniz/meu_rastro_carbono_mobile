import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/datasets/levels_dataset.dart';
import '../../data/models/evolution/level_model.dart';
import '../../stores/state_controller.dart';
import '../../stores/user_controller.dart';
import '../../stores/user_evolution_controller.dart';
import '../assets/styles/app_theme.dart';
import '../components/loading.dart';
import '../widgets/menu/levels_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserController userController = Modular.get<UserController>();
  final StateController stateCtrl = Modular.get<StateController>();
  final UserEvolutionController evolutionCtrl =
      Modular.get<UserEvolutionController>();

  var level = LevelModel(
      title: 'Preparando o solo',
      number: '1',
      imagePath: 'lib/ui/assets/images/leaf_05.png',
      color: Colors.blue[100]!,
      isAvailable: true);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userController.getUserRewards();
    getUserEvolutionPontuation();
  }

  Future<void> getUserEvolutionPontuation() async {
    var evolutionLevels = getLevels();
    await evolutionCtrl.initializeSharedPreferences();
    var pontuation = await evolutionCtrl.getUserElovutionPoints();
    pontuation = 21;
    var pontuationTemp = pontuation;

    int n0 = 5;
    int n = n0;

    for (int i = 0; i <= evolutionLevels.length; i++) {
      int nextNumber = n + (n.abs() ~/ 2);
      evolutionLevels[i].pontuationToBeReached = nextNumber;

      if (pontuationTemp == 0) {
        break;
      }

      if (nextNumber <= pontuationTemp) {
        pontuationTemp = pontuationTemp - nextNumber;
        evolutionLevels[i].userPontuationPercentage =
            getLevelProgressInPercentage(nextNumber, nextNumber);
      } else {
        evolutionLevels[i].userPontuationPercentage =
            getLevelProgressInPercentage(pontuationTemp, nextNumber);
        pontuationTemp = 0;
      }
      n = nextNumber;
      evolutionLevels[i].isAvailable = true;
    }

    var currentLevel = evolutionLevels.lastWhere((l) => l.isAvailable);
    setState(() {
      level = currentLevel;
    });
  }

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
          Observer(
              builder: (_) =>
                  stateCtrl.loading ? loadingIndicatorWidget() : Container()),
          Observer(
              builder: (_) => !stateCtrl.loading &&
                      userController.rewards.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Card(
                          elevation: 5,
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              const SizedBox(width: 3),
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.lightGreen[100],
                                child: Image.asset(
                                    'lib/ui/assets/images/leaf.png',
                                    height: 45),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        "Opa, você ainda não possui nenhuma conquista. Mantenha hábitos sustentáveis e logo receberá!",
                                        style:
                                            makeAppTheme().textTheme.bodyMedium)
                                  ],
                                ),
                              ),
                            ],
                          )))
                  : Container()),
          Observer(
              builder: (_) =>
                  Wrap(spacing: 10, runSpacing: 10, children: <Widget>[
                    for (int i = 0; i < userController.rewards.length; i++)
                      SizedBox(
                        height: 80,
                        child: ListTile(
                          leading: Icon(
                            userController.rewards[i].icon,
                            color: userController.rewards[i].color,
                          ),
                          title: Text(userController.rewards[i].title,
                              style: Theme.of(context).textTheme.titleSmall),
                          subtitle: Text(userController.rewards[i].description,
                              style: Theme.of(context).textTheme.bodySmall),
                          dense: true,
                        ),
                      )
                  ]))
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

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/stores/state_controller.dart';
import 'package:meu_rastro_carbono/ui/pages/profile_page.dart';

import '../../data/models/evolution/level_model.dart';
import '../../stores/user_evolution_controller.dart';
import '../assets/styles/app_theme.dart';
import '../components/loading.dart';

class Tip {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const Tip({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}

class CarbonWasteTipsScreen extends StatefulWidget {
  @override
  State<CarbonWasteTipsScreen> createState() => _CarbonWasteTipsScreenState();
}

class _CarbonWasteTipsScreenState extends State<CarbonWasteTipsScreen> {
  final UserEvolutionController metricsCtrl =
      Modular.get<UserEvolutionController>();
  final StateController stateCtrl = Modular.get<StateController>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    metricsCtrl.getUserTips();
  }

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
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 17),
                          blurRadius: 23,
                          spreadRadius: -13,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.lightGreen[100],
                          child: Image.asset('lib/ui/assets/images/leaf.png',
                              height: 45),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Observer(
                                  builder: (_) => !stateCtrl.loading &&
                                          metricsCtrl.tips.isEmpty
                                      ? Text(
                                          "As recomendações são personalizadas conforme seus hábitos. Por favor responda algumas pesquisas para que eu possa gerar as dicas!",
                                          style: makeAppTheme()
                                              .textTheme
                                              .bodyMedium)
                                      : Text(
                                          "Com base em seus hábitos ${metricsCtrl.tips.isEmpty ? 'prepararei' : 'preparei'} algumas dicas para você!",
                                          style: makeAppTheme()
                                              .textTheme
                                              .bodyMedium)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
          Observer(
              builder: (_) =>
                  stateCtrl.loading ? loadingIndicatorWidget() : Container()),
          Observer(
              builder: (_) =>
                  Wrap(spacing: 10, runSpacing: 10, children: <Widget>[
                    for (int i = 0; i < metricsCtrl.tips.length; i++)
                      Padding(
                          padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 0),
                          child: Card(
                            elevation: 5,
                            color: Colors.white,
                            child: ListTile(
                              title: Row(
                                children: [
                                  Icon(
                                    metricsCtrl.tips[i].icon,
                                    color: metricsCtrl.tips[i].color,
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      metricsCtrl.tips[i].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.visible,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Text(metricsCtrl.tips[i].subtitle,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ))
                  ])),
        ],
      ),
    );
  }
}

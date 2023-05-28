import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/data/models/metrics/user_metrics_model.dart';

import '../../stores/user_evolution_controller.dart';
import '../assets/styles/app_theme.dart';

class EcoMetricsDashboard extends StatefulWidget {
  @override
  State<EcoMetricsDashboard> createState() => _EcoMetricsDashboardState();
}

class _EcoMetricsDashboardState extends State<EcoMetricsDashboard> {
  final UserEvolutionController metricsCtrl =
      Modular.get<UserEvolutionController>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    metricsCtrl.getUserMetrics();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.green,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text("Em um ano você precisará plantar",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                            width: size.width * .15,
                            child: Observer(
                                builder: (_) => Text(metricsCtrl.treesAmount,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)))),
                      ],
                    ),
                    const Image(
                      image: AssetImage('lib/ui/assets/images/tree.png'),
                      width: 115,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: size.width * 0.9,
                  child: const Text(
                      "na mata atlântica para compensar as emissões nas atividades informadas durante a última semana",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
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
                  backgroundColor: Colors.grey[300],
                  child:
                      Image.asset('lib/ui/assets/images/leaf.png', height: 45),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          "Veja abaixo o rastro de CO2e que você deixa no planeta através de seu estilo de vida",
                          style: makeAppTheme().textTheme.bodySmall)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Observer(
              builder: (_) =>
                  Wrap(spacing: 10, runSpacing: 10, children: <Widget>[
                    for (int i = 0; i < metricsCtrl.metrics.length; i++)
                      EmissionCard(
                          title: metricsCtrl.metrics[i].metricName,
                          row1: metricsCtrl.metrics[i].useDescription,
                          row2: metricsCtrl.metrics[i].emission,
                          icon: metricsCtrl.metrics[i].icon)
                  ])),
        ],
      ),
    );
  }
}

Widget _buildEmissionCards(List<UserMetricsModel> metrics) {
  List<EmissionCard> list = [];
  metrics.map((m) => list.add(EmissionCard(
      title: m.metricName,
      row1: m.useDescription,
      row2: m.emission,
      icon: m.icon)));

  return Wrap(spacing: 10, runSpacing: 10, children: <Widget>[...list]);
}

class EmissionCard extends StatelessWidget {
  final String title;
  final String row1;
  final String row2;
  final IconData icon;

  const EmissionCard({
    super.key,
    required this.title,
    required this.row1,
    required this.row2,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          height: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark.withOpacity(0.7),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => {},
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                  child: Column(
                    children: [
                      Text(title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      Container(
                        height: 35,
                        width: 35,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green),
                        ),
                        child: Icon(
                          icon,
                          color: Colors.green,
                        ),
                      ),
                      Text(row1, style: Theme.of(context).textTheme.bodySmall),
                      Text(row2, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  )),
            ),
          ),
        ),
      );
    });
  }
}

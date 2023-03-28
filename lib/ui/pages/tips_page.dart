import 'package:flutter/material.dart';

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

class CarbonWasteTipsScreen extends StatelessWidget {
  final List<Tip> tips = [
    Tip(
      title: 'Use sacolas reutilizáveis',
      subtitle: 'Traga sua própria sacola ao fazer compras',
      icon: Icons.shopping_bag,
      color: Colors.green,
    ),
    Tip(
      title: 'Reduza o uso de água',
      subtitle: 'Tome banhos mais curtos e conserte vazamentos',
      icon: Icons.water_drop,
      color: Colors.blue,
    ),
    Tip(
      title: 'Evite desperdício de alimentos',
      subtitle: 'Planeje suas refeições e utilize sobras',
      icon: Icons.food_bank,
      color: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
              child: const Image(
                image: AssetImage('lib/ui/assets/images/leaf.png'),
                width: 115,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5, 12, 5),
                child: Text(
                  style: Theme.of(context).textTheme.bodyLarge,
                  "Tenho algumas dicas para você!",
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tips.length,
            itemBuilder: (context, index) {
              final tip = tips[index];
              return Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5, 12, 5),
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(
                        tip.icon,
                        color: tip.color,
                      ),
                      title: Text(
                        tip.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(tip.subtitle),
                    ),
                  ));
            },
          ),
        ),
      ],
    ));
  }
}

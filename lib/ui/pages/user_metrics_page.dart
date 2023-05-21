import 'package:flutter/material.dart';

class EcoMetricsDashboard extends StatelessWidget {
  final double energyUsage;
  final double transportationUsage;
  final double wasteProduction;
  final double waterUsage;
  final double foodProduction;
  final double paperUsage;
  final double plasticUsage;
  final double airTravel;
  final double meatConsumption;
  final double clothingProduction;

  EcoMetricsDashboard({
    required this.energyUsage,
    required this.transportationUsage,
    required this.wasteProduction,
    required this.waterUsage,
    required this.foodProduction,
    required this.paperUsage,
    required this.plasticUsage,
    required this.airTravel,
    required this.meatConsumption,
    required this.clothingProduction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(6.0, 0, 0, 8),
                  child: const Image(
                    image: AssetImage('lib/ui/assets/images/leaf.png'),
                    width: 115,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 5, 12, 5),
                    child: Text(
                      style: Theme.of(context).textTheme.titleMedium,
                      "Pegada de carbono semanal",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMetricBox('Uso de Energia',
                    energyUsage.toStringAsFixed(2) + ' kWh', Colors.pink),
                // SizedBox(width: 16),
                // _buildMetricBox('Locomoção', transportationUsage.toStringAsFixed(2) + ' mi', Colors.blue),
                SizedBox(width: 16),
                _buildMetricBox('Desperdício',
                    wasteProduction.toStringAsFixed(2) + ' CO2e', Colors.purple),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMetricBox('Consumo de alimentos',
                    foodProduction.toStringAsFixed(2) + ' CO2e', Colors.indigo),
                SizedBox(width: 16),
                _buildMetricBox('Combustível',
                    paperUsage.toStringAsFixed(2) + ' CO2e', Colors.blue),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMetricBox('Entretenimento',
                    plasticUsage.toStringAsFixed(2) + ' CO2', Colors.purple),
                SizedBox(width: 16),
                // _buildMetricBox('Air Travel', airTravel.toStringAsFixed(2) + ' mi', Colors.indigo),
                _buildMetricBox('Consumo de água',
                    meatConsumption.toStringAsFixed(2) + ' CO2e', Colors.pink),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMetricBox('Uso de água na produção de alimento',
                    clothingProduction.toStringAsFixed(2) + ' CO2e', Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricBox(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

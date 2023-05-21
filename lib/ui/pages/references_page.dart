import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/models/references/reference_model.dart';

class ReferencesPage extends StatelessWidget {
  final String _pageTitle = 'Créditos';

  ReferencesPage({super.key});

  final references = [
    ReferenceModel(
        theme: "Emissão de carbono da água",
        references: [
          ReferenceItemModel(
              title: 'Definição do cálculo e fatores- Eraclimate',
              link:
                  'https://app.eraclimate.com/emissions-estimator'),
          ReferenceItemModel(
              title: 'Recomendações - WaterFootprint',
              link:
                  'https://www.waterfootprint.org/resources/TheWaterFootprintAssessmentManual_Portuguese.pdf'),
        ]),
    ReferenceModel(
        theme: "Emissão de carbono do transporte",
        references: [
          ReferenceItemModel(
              title: 'Definição do cálculo e fatores - Iniciativa verde',
              link:
                  'https://iniciativaverde.org.br/calculadora'),
          ReferenceItemModel(title: '', link: ''),
        ]),
    ReferenceModel(theme: "Imagens", references: [
      ReferenceItemModel(
          title: 'Mascotes - Freepik',
          link:
              'https://www.freepik.com/free-vector/happy-green-friends_797855.htm#query=cute%20tree&position=45&from_view=search&track=ais'),
      ReferenceItemModel(title: 'Bicicleta - Freepik', link: 'https://www.flaticon.com/free-icons/bicycle'),
      ReferenceItemModel(title: 'Motocicleta - Freepik', link: 'https://www.flaticon.com/free-icons/motorcycle'),
      ReferenceItemModel(title: 'Pedestre - Freepik', link: 'https://www.flaticon.com/free-icons/walk'),
      ReferenceItemModel(title: 'Ônibus - Freepik', link: 'https://www.flaticon.com/free-icons/bus'),
      ReferenceItemModel(title: 'Trem - Freepik', link: 'https://www.flaticon.com/free-icons/train'),
      ReferenceItemModel(title: 'Metrô - Freepik', link: 'https://www.flaticon.com/free-icons/subway'),
      ReferenceItemModel(title: 'Carro - Freepik', link: 'https://www.flaticon.com/free-icons/car'),
      ReferenceItemModel(title: 'Nenhuma opção - Freepik', link: 'https://www.flaticon.com/free-icons/block'),
    ]),
  ];

  List<Widget> buildReferences(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < references.length; i++) {
      var r = references[i];
      drawerOptions.add(Text(
        style: Theme.of(context).textTheme.titleMedium,
        r.theme,
      ));
      for (var j = 0; j < r.references.length; j++) {
        var credit = r.references[j];
        drawerOptions.add(Text(
          style: Theme.of(context).textTheme.titleSmall,
          credit.title,
        ));
        drawerOptions.add(InkWell(
          onTap: () => launchUrl(Uri.parse(credit.link)),
          child: Text(
            credit.link,
            style: Theme.of(context).textTheme.bodySmall,
            // style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
          ),
          // Theme.of(context).textTheme.bodySmall
        ));
      }
      drawerOptions.add(const SizedBox(height: 8));
    }
    return drawerOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitle,
            style: const TextStyle(color: Colors.white, fontSize: 26)),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: 
        SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Para saber mais:',
                style: Theme.of(context).textTheme.bodyMedium),
            ...buildReferences(context)
          ],
        ),
      ),
    ));
  }
}

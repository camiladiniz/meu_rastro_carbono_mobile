import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/ui/widgets/menu/bottom_navigation_widget.dart';
import 'package:meu_rastro_carbono/ui/widgets/models/menu_navigate_item_model.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final List<NavigateItemModel> pages = [
    NavigateItemModel('Conquistas', Icons.workspace_premium_rounded, () => {Modular.to.navigate('./rewards')}),
    NavigateItemModel('Dicas', Icons.tips_and_updates, () => {Modular.to.navigate('./tips')}),
    NavigateItemModel('Home', Icons.home, () => {Modular.to.navigate('./surveys')}),
    NavigateItemModel('Métricas', Icons.graphic_eq, () => {Modular.to.navigate('./metrics')}),
    NavigateItemModel('Perfil', Icons.person, () => {Modular.to.navigate('./profile')}),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Meu rastro',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26
              ),),
              centerTitle: true,
              backgroundColor: Colors.green,
            ),
            body: const Row(children: [
              Expanded(child: RouterOutlet()),
            ]),
            bottomNavigationBar: BottomNavigationWidget(pages: pages)));
  }
}


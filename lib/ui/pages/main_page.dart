import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/ui/widgets/header/header_widget.dart';
import 'package:meu_rastro_carbono/ui/widgets/menu/bottom_navigation_widget.dart';
import 'package:meu_rastro_carbono/ui/widgets/models/menu_navigate_item_model.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<NavigateItemModel> pages = [
    NavigateItemModel('Minha evolução', Icons.workspace_premium_rounded, () => {Modular.to.navigate('./rewards')}),
    NavigateItemModel('Minhas recomendações', Icons.tips_and_updates, () => {Modular.to.navigate('./tips')}),
    NavigateItemModel('Meu consumo', Icons.home, () => {Modular.to.navigate('./surveys')}),
    NavigateItemModel('Meu rastro', Icons.graphic_eq, () => {Modular.to.navigate('./metrics')}),
    NavigateItemModel('Perfil', Icons.person, () => {Modular.to.navigate('./profile')}),
  ];

  int _selectedMenuIndex = 0;

  void _onMenuItemTapped(int index) {
    setState(() {
      _selectedMenuIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            appBar: HeaderWidget(pages[_selectedMenuIndex].title),
            body: const Row(children: [
              Expanded(child: RouterOutlet()),
            ]),
            bottomNavigationBar: BottomNavigationWidget(
                pages: pages,
                selectedIndex: _selectedMenuIndex,
                onItemTapped: _onMenuItemTapped)));
  }
}

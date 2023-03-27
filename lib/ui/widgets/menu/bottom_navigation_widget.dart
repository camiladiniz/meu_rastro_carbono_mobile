import 'package:flutter/material.dart';
import 'package:meu_rastro_carbono/ui/widgets/models/menu_navigate_item_model.dart';

class BottomNavigationWidget extends StatefulWidget {
  final List<NavigateItemModel> pages;

  BottomNavigationWidget({required this.pages});

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          for (int i = 0; i < widget.pages.length; i++)
            i == 2
                ? SizedBox(
                    width: 60,
                    height: 60,
                    child: GestureDetector(
                      onTap: () => {widget.pages[i].onTap()},
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  )
                : IconButton(
                    icon: Icon(widget.pages[i].icon),
                    color: _selectedIndex == i
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    onPressed: () => {widget.pages[i].onTap()},
                  ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meu_rastro_carbono/ui/widgets/models/menu_navigate_item_model.dart';

class BottomNavigationWidget extends StatefulWidget {
  final List<NavigateItemModel> pages;
  final int selectedIndex;
  final Function onItemTapped;

  const BottomNavigationWidget(
      {super.key,
      required this.pages,
      required this.selectedIndex,
      required this.onItemTapped});

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 3.0, offset: Offset(0.0, 0.95))
      ], color: Colors.white),
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
                      onTap: () {
                        widget.onItemTapped(i);
                        widget.pages[i].onTap();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Icon(
                          widget.pages[i].icon,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  )
                : IconButton(
                    icon: Icon(widget.pages[i].icon),
                    color: widget.selectedIndex == i
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    onPressed: () {
                      widget.onItemTapped(i);
                      widget.pages[i].onTap();
                    },
                  ),
        ],
      ),
    );
  }
}

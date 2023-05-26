import 'package:flutter/material.dart';

import '../../assets/styles/app_theme.dart';

class InputContainer extends StatelessWidget {
  final Widget child;
  final bool backgroundColor;

  const InputContainer({
    Key? key,
    required this.child,
    required this.backgroundColor
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: backgroundColor ? const EdgeInsets.symmetric(horizontal: 20, vertical: 0) : const EdgeInsets.all(0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: backgroundColor ? makeAppTheme().primaryColor.withAlpha(40) : Colors.transparent
      ),

      child: child
    );
  }
}
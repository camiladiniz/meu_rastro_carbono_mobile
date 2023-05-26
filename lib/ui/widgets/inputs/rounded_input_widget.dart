import 'package:flutter/material.dart';
import '../../assets/styles/app_theme.dart';
import 'input_container_widget.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.icon,
    required this.hint
  }) : super(key: key);

  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      backgroundColor: true,
      child: TextField(
        cursorColor: makeAppTheme().primaryColor,
        decoration: InputDecoration(
          icon: Icon(icon, color: makeAppTheme().primaryColor),
          hintText: hint,
          border: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.titleSmall,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ));
  }
}
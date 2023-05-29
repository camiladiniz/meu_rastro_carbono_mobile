import 'package:flutter/material.dart';
import '../../assets/styles/app_theme.dart';
import 'input_container_widget.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({
    Key? key,
    required this.hint,
    required this.controller,
    required this.whiteBackground,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final bool whiteBackground;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        backgroundColor: true,
        child: TextField(
          controller: controller,
          cursorColor: makeAppTheme().primaryColor,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock,
                color: whiteBackground
                    ? Colors.white
                    : makeAppTheme().primaryColor),
            hintText: hint,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: whiteBackground
                ? const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )
                : Theme.of(context).textTheme.titleSmall,
          ),
        ));
  }
}

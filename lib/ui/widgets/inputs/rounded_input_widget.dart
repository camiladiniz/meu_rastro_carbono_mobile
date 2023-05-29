import 'package:flutter/material.dart';
import '../../assets/styles/app_theme.dart';
import 'input_container_widget.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.icon,
    required this.whiteBackground,
    required this.hint,
    required this.controller,
    required this.onInputChanged,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final Function onInputChanged;

  final IconData icon;
  final bool whiteBackground;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        backgroundColor: true,
        child: TextField(
          controller: controller,
          onChanged: (value) => {onInputChanged()},
          cursorColor: makeAppTheme().primaryColor,
          decoration: InputDecoration(
            icon: Icon(icon,
                color: whiteBackground
                    ? Colors.white
                    : makeAppTheme().primaryColor),
            hintText: hint,
            border: InputBorder.none,
            hintStyle: whiteBackground
                ? const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )
                : Theme.of(context).textTheme.titleSmall,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ));
  }
}

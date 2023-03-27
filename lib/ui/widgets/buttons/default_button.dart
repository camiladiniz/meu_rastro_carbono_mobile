import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;

  const DefaultButtonWidget(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {onPressed()},
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
        shadowColor:
            MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
        elevation: MaterialStateProperty.all<double>(5),
        minimumSize:
            MaterialStateProperty.all<Size>(const Size(double.infinity, 42)),
      ),
      child: Center(
          child: Text(text.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ))),
    );
  }
}

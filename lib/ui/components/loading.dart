import 'package:flutter/material.dart';

Widget loadingIndicatorWidget() {
  const Color backgroundColor = Color.fromRGBO(217, 216, 215, 0.5);

  return Container(
      width: 70.0,
      height: 70.0,
      decoration: const BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Center(child: CircularProgressIndicator())));
}

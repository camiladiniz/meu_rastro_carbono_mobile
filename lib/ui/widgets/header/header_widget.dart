import 'package:flutter/material.dart';

AppBar HeaderWidget(String pageName) {
  return AppBar(
    title: Text(
      pageName,
      style: const TextStyle(color: Colors.white, fontSize: 26),
    ),
    centerTitle: true,
    backgroundColor: Colors.green,
  );
}

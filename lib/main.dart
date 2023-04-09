import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/main/app_module.dart';
import 'package:meu_rastro_carbono/main/app_widget.dart';

void main() {
  // runApp(const MyApp());
  return runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/main/app_module.dart';
import 'package:meu_rastro_carbono/main/app_widget.dart';
import 'package:meu_rastro_carbono/ui/assets/styles/app_theme.dart';
import 'package:meu_rastro_carbono/ui/pages/welcome_page.dart';

void main() {
  // runApp(const MyApp());
  return runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}

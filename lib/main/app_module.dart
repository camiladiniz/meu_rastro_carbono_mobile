import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/ui/pages/main_page.dart';
import 'package:meu_rastro_carbono/ui/pages/surveys_page.dart';
import 'package:meu_rastro_carbono/ui/pages/welcome_page.dart';

import '../ui/pages/survey_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        // ChildRoute('/', child: (context, args) => const WelcomePage()),
        ChildRoute('/welcome', child: (context, args) => const WelcomePage()),
        ChildRoute('/home', child: (context, args) => MainPage(), children: [
          ChildRoute('/rewards', child: (context, args) => Container(color: Colors.red)),
          ChildRoute('/tips', child: (context, args) => Container(color: Colors.blue)),
          ChildRoute('/surveys', child: (context, args) => SurveysPage()),
          ChildRoute('/metrics', child: (context, args) => Container(color: Colors.blue)),
          ChildRoute('/profile', child: (context, args) => Container(color: Colors.blue)),
        ]),
        ChildRoute('/survey', child: (context, args) => SurveyPage()),
        ChildRoute('/', child: (context, args) => SurveyPage()),
      ];
}

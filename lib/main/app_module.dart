import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/ui/pages/login_page.dart';
import 'package:meu_rastro_carbono/ui/pages/main_page.dart';
import 'package:meu_rastro_carbono/ui/pages/profile_page.dart';
import 'package:meu_rastro_carbono/ui/pages/surveys_page.dart';
import 'package:meu_rastro_carbono/ui/pages/welcome_page.dart';

import '../ui/pages/references_page.dart';
import '../ui/pages/rewards_page.dart';
import '../ui/pages/survey_page.dart';
import '../ui/pages/tips_page.dart';
import '../ui/pages/user_metrics_page.dart';

class Reward {
  final String name;
  final int pointsRequired;
  final String imageUrl;

  Reward({
    required this.name,
    required this.pointsRequired,
    required this.imageUrl,
  });
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginPage()),
        ChildRoute('/login', child: (context, args) => LoginPage()),
        ChildRoute('/welcome', child: (context, args) => const WelcomePage()),
        ChildRoute('/home', child: (context, args) => MainPage(), children: [
          ChildRoute('/rewards',
              child: (context, args) => RewardsWidget()),
          ChildRoute('/tips',
              child: (context, args) => CarbonWasteTipsScreen()),
          ChildRoute('/surveys', child: (context, args) => SurveysPage()),
          ChildRoute('/metrics',
              child: (context, args) => EcoMetricsDashboard(
                    energyUsage: 1500,
                    transportationUsage: 0.8,
                    wasteProduction: 25,
                    waterUsage: 3000,
                    foodProduction: 2.5,
                    paperUsage: 1.2,
                    plasticUsage: 0.8,
                    airTravel: 1.5,
                    meatConsumption: 0.5,
                    clothingProduction: 0.3,
                  )),
          ChildRoute('/profile',
              child: (context, args) => ProfilePage()),
        ]),
        ChildRoute('/survey/:id', child: (context, args) => SurveyPage(surveyTheme: args.params['id'])),
        ChildRoute('/references',
            child: (context, args) => ReferencesPage()),
        // ChildRoute('/', child: (context, args) => SurveyPage()),
      ];
}

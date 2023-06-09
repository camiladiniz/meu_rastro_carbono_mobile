import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:meu_rastro_carbono/stores/user_controller.dart';
import 'package:meu_rastro_carbono/ui/pages/login_page.dart';
import 'package:meu_rastro_carbono/ui/pages/main_page.dart';
import 'package:meu_rastro_carbono/ui/pages/profile_page.dart';
import 'package:meu_rastro_carbono/ui/pages/surveys_page.dart';
import 'package:meu_rastro_carbono/ui/pages/welcome_page.dart';
import '../data/repositories/account_repository.dart';
import '../data/repositories/evolution_repository.dart';
import '../data/repositories/survey_repository.dart';
import '../infra/shared_preference_service.dart';
import '../stores/state_controller.dart';
import '../stores/survey_controller.dart';
import '../stores/user_evolution_controller.dart';
import '../ui/pages/references_page.dart';
import '../ui/pages/evolution_page.dart';
import '../ui/pages/survey_page.dart';
import '../ui/pages/tips_page.dart';
import '../ui/pages/user_metrics_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        
        // services
        AsyncBind<SharedPreferences>(
            (i) async => SharedPreferences.getInstance()),
        Bind((i) => SharedPreferencesService()),
        Bind.lazySingleton((i) => http.Client()),

        // repositories
        Bind.lazySingleton((i) => AccountRepository(i())),
        Bind.lazySingleton((i) => UserRevolutionRepository(i())),
        Bind.lazySingleton((i) => SurveyRepository(i())),

        // controllers
        Bind((i) => StateController()),
        Bind((i) => UserController()),
        Bind((i) => UserEvolutionController()),
        Bind((i) => SurveyController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => WelcomePage()),
        ChildRoute('/login', child: (context, args) => LoginPage()),
        ChildRoute('/home', child: (context, args) => MainPage(), children: [
          ChildRoute('/rewards', child: (context, args) => RewardsWidget()),
          ChildRoute('/tips',
              child: (context, args) => CarbonWasteTipsScreen()),
          ChildRoute('/surveys', child: (context, args) => SurveysPage()),
          ChildRoute('/metrics',
              child: (context, args) => EcoMetricsDashboard()),
          ChildRoute('/profile', child: (context, args) => ProfilePage()),
        ]),
        ChildRoute('/survey/:id',
            child: (context, args) =>
                SurveyPage(surveyTheme: args.params['id'])),
        ChildRoute('/references', child: (context, args) => ReferencesPage()),
        // ChildRoute('/', child: (context, args) => SurveyPage()),
      ];
}

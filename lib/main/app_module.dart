import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/ui/pages/welcome_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const WelcomePage()),
    ChildRoute('/welcome', child: (context, args) => const WelcomePage()),
  ];
}
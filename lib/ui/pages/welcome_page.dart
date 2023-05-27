import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/ui/widgets/buttons/default_button.dart';

import '../../stores/user_controller.dart';

class WelcomePage extends StatefulWidget {
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final UserController userController = Modular.get<UserController>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadAuthData();
  }

  Future<void> loadAuthData() async {
    await userController.initializeSharedPreferences();
    var userIsAuthenticated = await userController.isAuthenticated();
    if (userIsAuthenticated == true) {
      Modular.to.navigate('/home/surveys');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(image: AssetImage('lib/ui/assets/images/leaf.png')),
                const SizedBox(height: 20),
                Text(
                  style: Theme.of(context).textTheme.titleMedium,
                  'Bem-vindo!',
                ),
                const SizedBox(height: 5),
                Text(
                  style: Theme.of(context).textTheme.bodyMedium,
                  'Eu sou o Arkki e te ajudarei a fazer com que seu rastro de carbono seja menos destrutivo para as próximas gerações!',
                ),
                const SizedBox(height: 25),
                DefaultButtonWidget(
                  text: 'Vamos lá',
                  onPressed: () => Modular.to.navigate('/login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

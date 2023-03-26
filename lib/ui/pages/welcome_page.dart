import 'package:flutter/material.dart';
import 'package:meu_rastro_carbono/ui/widgets/buttons/default_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Meu rastro'),
      ),
      body: Center(
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
                'Eu sou o Arkki e te ajudarei a fazer com que seu rastro de carbono seja menos destrutivo para as próximas gerações!'),
            const SizedBox(height: 25),
            DefaultButtonWidget(
              text: 'Vamos lá',
              onPressed: () => {},
            ),
          ],
        ),
      ),
    ));
  }
}

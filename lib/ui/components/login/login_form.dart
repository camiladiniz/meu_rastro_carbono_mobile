import 'package:flutter/material.dart';

import '../../widgets/buttons/default_button.dart';
import '../../widgets/inputs/input_container_widget.dart';
import '../../widgets/inputs/rounded_input_widget.dart';
import '../../widgets/inputs/rounded_password_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: size.width,
          height: defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Meu rastro de carbono',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 30),
               Image(
                image: AssetImage('lib/ui/assets/images/leaf.png'),
                width: 200,
              ),
                SizedBox(height: 20),
                const RoundedInput(icon: Icons.mail, hint: 'Email'),
                const RoundedPasswordInput(hint: 'Senha'),
                
                InputContainer(
                  backgroundColor: false,
                  child:
                      DefaultButtonWidget(text: 'LOGIN', onPressed: () => {}),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

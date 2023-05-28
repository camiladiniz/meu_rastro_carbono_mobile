import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../stores/user_controller.dart';
import '../../widgets/buttons/default_button.dart';
import '../../widgets/inputs/input_container_widget.dart';
import '../../widgets/inputs/rounded_input_widget.dart';
import '../../widgets/inputs/rounded_password_widget.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  });

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController txtEmailCtrl = TextEditingController();
  TextEditingController txtPasswordCtrl = TextEditingController();
  final UserController userController = Modular.get<UserController>();

  signIn() {
    userController.authenticate(txtEmailCtrl.text, txtPasswordCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 1.0 : 0.0,
      duration: widget.animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: widget.size.width,
          height: widget.defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Meu rastro de carbono',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 30),
                const Image(
                  image: AssetImage('lib/ui/assets/images/leaf.png'),
                  width: 200,
                ),
                const SizedBox(height: 20),
                RoundedInput(
                    icon: Icons.mail, hint: 'Email', controller: txtEmailCtrl),
                RoundedPasswordInput(
                    hint: 'Senha', controller: txtPasswordCtrl),
                Text(
                  userController.loginError,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.red,
                  ),
                ),
                InputContainer(
                    backgroundColor: false,
                    child:
                        DefaultButtonWidget(text: 'LOGIN', onPressed: signIn)),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

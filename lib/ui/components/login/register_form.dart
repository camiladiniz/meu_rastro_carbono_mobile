import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../stores/user_controller.dart';
import '../../widgets/buttons/default_button.dart';
import '../../widgets/inputs/input_container_widget.dart';
import '../../widgets/inputs/rounded_input_widget.dart';
import '../../widgets/inputs/rounded_password_widget.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
    required this.isLogin,
    required this.onInputChanged,
    required this.closeRegister,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
    required this.signup,
    required this.errorMessage,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  final Function closeRegister;
  final Function signup;
  final String errorMessage;
  final Function onInputChanged;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController txtNameCtrl = TextEditingController();
  TextEditingController txtEmailCtrl = TextEditingController();
  TextEditingController txtPasswordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    signup() {
      widget.signup(txtNameCtrl.text, txtEmailCtrl.text, txtPasswordCtrl.text);
    }

    return AnimatedOpacity(
      opacity: widget.isLogin ? 0.0 : 1.0,
      duration: widget.animationDuration * 5,
      child: Visibility(
        visible: !widget.isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: widget.size.width,
            height: widget.defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    width: size.width * .8,
                    child: const Text(
                      'Informe seus dados para começar!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.blue[100],
                    child: Image.asset('lib/ui/assets/images/leaf.png',
                        height: 100),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      widget.errorMessage,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  RoundedInput(
                    onInputChanged: widget.onInputChanged,
                      icon: Icons.person,
                      hint: 'Nome',
                      whiteBackground: true,
                      controller: txtNameCtrl),
                  RoundedInput(
                    onInputChanged: widget.onInputChanged,
                      icon: Icons.mail,
                      hint: 'Email',
                      whiteBackground: true,
                      controller: txtEmailCtrl),
                  RoundedPasswordInput(
                    hint: 'Senha',
                    controller: txtPasswordCtrl,
                    whiteBackground: true,
                  ),
                  InputContainer(
                      backgroundColor: false,
                      child: DefaultButtonWidget(
                          text: 'Cadastrar',
                          onPressed: signup,
                          whiteBackground: true)),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

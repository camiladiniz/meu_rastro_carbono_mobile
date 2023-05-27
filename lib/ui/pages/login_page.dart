import 'package:flutter/material.dart';

import '../assets/styles/app_theme.dart';
import '../components/login/cancel_button_widget.dart';
import '../components/login/login_form.dart';
import '../components/login/register_form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  
  bool isLogin = true;
  late Animation<double> containerSize;
  AnimationController? animationController;
  Duration animationDuration = const Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context).viewInsets.bottom; // we are using this to determine Keyboard is opened or not
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize = Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize).animate(CurvedAnimation(parent: animationController!, curve: Curves.linear));

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 100,
            right: -50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: makeAppTheme().primaryColor.withAlpha(40)
              ),
            )
          ),

          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: makeAppTheme().primaryColor.withAlpha(30)
              ),
            )
          ),

          // Cancel Button
          CancelButton(
            isLogin: isLogin,
            animationDuration: animationDuration,
            size: size,
            animationController: animationController,
            tapEvent: isLogin ? null : () { // returning null to disable the button
              animationController!.reverse();
              setState(() {
                isLogin = !isLogin;
              });
            },
          ),

          // Login Form
          LoginForm(isLogin: isLogin, animationDuration: animationDuration, size: size, defaultLoginSize: defaultLoginSize),

          // Register Container
          AnimatedBuilder(
            animation: animationController!,
            builder: (context, child) {
              if (viewInset == 0 && isLogin) {
                return buildRegisterContainer();
              } else if (!isLogin) {
                return buildRegisterContainer();
              }

              // Returning empty container to hide the widget
              return Container();
            },
          ),

          // Register Form
          RegisterForm(isLogin: isLogin, animationDuration: animationDuration, size: size, defaultLoginSize: defaultRegisterSize),
        ],
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          color: makeAppTheme().highlightColor
        ),

        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin ? null : () {
            animationController!.forward();

            setState(() {
              isLogin = !isLogin;
            });
          },
          child: isLogin ? const Text(
            "Não tem uma conta? Cadastre-se!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ) : null,
        ),
      ),
    );
  }
}
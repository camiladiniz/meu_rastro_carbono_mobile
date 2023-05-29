import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../stores/user_controller.dart';
import '../assets/styles/app_theme.dart';
import '../components/login/cancel_button_widget.dart';
import '../components/login/login_form.dart';
import '../components/login/register_form.dart';
import '../widgets/buttons/default_button.dart';
import '../widgets/inputs/input_container_widget.dart';
import '../widgets/inputs/rounded_input_widget.dart';
import '../widgets/inputs/rounded_password_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  bool isLoading = false;
  late Animation<double> containerSize;
  AnimationController? animationController;
  Duration animationDuration = const Duration(milliseconds: 270);

  final UserController userController = Modular.get<UserController>();

  TextEditingController txtEmailLoginCtrl = TextEditingController();
  TextEditingController txtPasswordLoginCtrl = TextEditingController();

  signUp(String name, String email, String password) async {
    var response = await userController.register(name, email, password);
    if (response) {
      animationController!.reverse();
      setState(() {
        isLogin = !isLogin;
      });
    }
  }

    var resp = "n";
  signIn() async {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    var email = txtEmailLoginCtrl.text;
    var pass = txtPasswordLoginCtrl.text;
    var r = await userController.authenticate(email, pass);
    setState(() {
      isLoading = false;
      resp = r;
    });
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // signIn();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; // we are using this to determine Keyboard is opened or not
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize =
        Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize)
            .animate(CurvedAnimation(
                parent: animationController!, curve: Curves.linear));

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
                    color: makeAppTheme().primaryColor.withAlpha(40)),
              )),

          Positioned(
              top: -50,
              left: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: makeAppTheme().primaryColor.withAlpha(30)),
              )),

          // Cancel Button
          CancelButton(
            isLogin: isLogin,
            animationDuration: animationDuration,
            size: size,
            animationController: animationController,
            tapEvent: isLogin
                ? null
                : () {
                    // returning null to disable the button
                    animationController!.reverse();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
          ),

          // Login Form
          // LoginForm(
          //   isLogin: isLogin,
          //   animationDuration: animationDuration,
          //   size: size,
          //   defaultLoginSize: defaultLoginSize,
          //   doLogin: signIn,
          //   errorMessage: userController.loginError,
          // ),
          AnimatedOpacity(
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
                      const SizedBox(height: 30),
                      const Image(
                        image: AssetImage('lib/ui/assets/images/leaf.png'),
                        width: 200,
                      ),
                      // Text("login ${txtEmailLoginCtrl.text} senha ${txtPasswordLoginCtrl.text} resp $resp"),
                      const SizedBox(height: 20),
                      RoundedInput(
                        onInputChanged: userController.cleanError,
                          icon: Icons.mail,
                          hint: 'Email',
                          controller: txtEmailLoginCtrl,
                          whiteBackground: false),
                      RoundedPasswordInput(
                        hint: 'Senha',
                        controller: txtPasswordLoginCtrl,
                        whiteBackground: false,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          userController.loginError,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      InputContainer(
                          backgroundColor: false,
                          child: DefaultButtonWidget(
                              text: 'LOGIN',
                              onPressed: signIn,
                              whiteBackground: false)),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
          RegisterForm(
            onInputChanged: userController.cleanError,
              isLogin: isLogin,
              animationDuration: animationDuration,
              size: size,
              defaultLoginSize: defaultRegisterSize,
              errorMessage: userController.loginError,
              signup: signUp,
              closeRegister: () => {
                    setState(() {
                      animationController!.reverse();
                      setState(() {
                        isLogin = !isLogin;
                      });
                    })
                  }),
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
            color: makeAppTheme().highlightColor),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin
              ? null
              : () {
                  animationController!.forward();

                  setState(() {
                    isLogin = !isLogin;
                  });
                },
          child: isLogin
              ? const Text(
                  "Não tem uma conta? Cadastre-se!",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              : null,
        ),
      ),
    );
  }
}

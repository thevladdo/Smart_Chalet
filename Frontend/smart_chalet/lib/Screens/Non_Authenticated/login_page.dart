import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_chalet/Widget/title_row.dart';
import '../../Cubit/app_cubits.dart';
import '../../Widget/images.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 214, 225, 255),
          title: const TitleStack(),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                // REGISTRATION
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 125,
                  ),
                  const Positioned(
                    top: -80,
                    child: HeaderImageRound(),
                  ),
                  const Positioned(
                    top: 40,
                    left: 20,
                    child: Lights(),
                  ),
                  Positioned(
                    top: 95,
                    left: 20.w,
                    right: 20.w,
                    child: const LoginText(),
                  ),
                ],
              ),
              Stack(
                // FORM
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 650,
                  ),
                  Positioned(
                    top: 200,
                    width: 100.w,
                    child: const GradientFooter(),
                  ),
                  const Positioned(
                    top: 280,
                    left: -20,
                    child: NoLightsHome(),
                  ),
                  Positioned(
                    top: 0,
                    width: 100.w,
                    height: 700,
                    child: const LoginForm(),
                  ),
                  const Positioned(
                    top: 355,
                    left: 150,
                    right: 150,
                    child: RegButton(),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 90,
            child: EmailField(
              controller: _emailController,
            ),
          ),
          Positioned(
            top: 160,
            child: PasswordField(
              controller: _passwordController,
            ),
          ),
          Positioned(
            top: 295,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 169, 232, 221),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(255, 200, 205, 230),
                        offset: Offset.zero,
                        blurRadius: 20)
                  ],
                  border: Border.all(
                      color: const Color.fromARGB(255, 169, 232, 221)),
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(15, 15))),
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 169, 232, 221))),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final user = {
                      'email': _emailController.text,
                      'password': _passwordController.text,
                    };
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor:
                            const Color.fromARGB(255, 86, 163, 174),
                        elevation: 0,
                        action: SnackBarAction(
                            label: 'Thanks',
                            textColor: const Color.fromARGB(255, 169, 232, 221),
                            onPressed: () {
                              DismissAction;
                            }),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        content: Text(
                          user.toString(),
                        ),
                      ),
                    );
                    BlocProvider.of<AppCubits>(context).jumpNavigator();
                  }
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color.fromARGB(255, 82, 85, 96),
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LoginText extends StatelessWidget {
  const LoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //transform: Matrix4.translationValues(0, -180, 0),
      transformAlignment: Alignment.center,
      child: const Text(
        'LOGIN',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 22,
            letterSpacing: -1,
            color: Color.fromARGB(255, 82, 85, 96),
            shadows: <Shadow>[
              Shadow(
                  color: Color.fromARGB(255, 186, 193, 218),
                  offset: Offset.zero,
                  blurRadius: 20)
            ]),
      ),
    );
  }
}

class RegButton extends StatelessWidget {
  const RegButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromARGB(255, 214, 225, 255))),
        onPressed: () async {
          BlocProvider.of<AppCubits>(context).register();
        },
        child: RichText(
          text: const TextSpan(
            text: 'Register',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color.fromARGB(255, 120, 125, 141),
              letterSpacing: -1,
            ),
          ),
        ),
      ),
    );
  }
}

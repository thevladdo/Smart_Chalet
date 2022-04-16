import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_chalet/Widget/icons_buttons.dart';
import 'package:smart_chalet/Widget/title_row.dart';
import '../Utilities/validator.dart';
import '../Widget/images.dart';
import 'login_page.dart';

class RegPage extends StatefulWidget {
  const RegPage({Key? key}) : super(key: key);

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const IconHomeButton(),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 214, 225, 255),
          title: const TitleRow(),
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
                    child: const RegText(),
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
                    top: 50,
                    width: 100.w,
                    height: 700,
                    child: const RegForm(),
                  ),
                  const Positioned(
                    top: 355,
                    left: 150,
                    right: 150,
                    child: LogInButton(),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class RegForm extends StatefulWidget {
  const RegForm({Key? key}) : super(key: key);

  @override
  RegFormState createState() {
    return RegFormState();
  }
}

class RegFormState extends State<RegForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
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
            left: 30,
            child: NameField(
              controller: _nameController,
            ),
          ),
          Positioned(
            right: 30,
            child: SurnameField(
              controller: _surnameController,
            ),
          ),
          Positioned(
            top: 70,
            child: EmailField(
              controller: _emailController,
            ),
          ),
          Positioned(
            top: 140,
            child: PasswordField(
              controller: _passwordController,
            ),
          ),
          Positioned(
            top: 245,
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
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 169, 232, 221))),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final user = {
                      'name': _nameController.text,
                      'surname': _surnameController.text,
                      'email': _emailController.text,
                      'password': _passwordController.text,
                    };
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor:
                            const Color.fromARGB(255, 86, 163, 174),
                        elevation: 30,
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
                  }
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Register',
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

class NameField extends StatelessWidget {
  final TextEditingController controller;
  const NameField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 200, 205, 230),
                offset: Offset.zero,
                blurRadius: 20)
          ],
          borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty || !RegExp(r'^[a-zA-z]+$').hasMatch(value)) {
            return 'Enter your Name';
          } else {
            return null;
          }
        },
        cursorColor: const Color.fromARGB(255, 124, 208, 193),
        controller: controller,
        onFieldSubmitted: (value) {},
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          errorStyle: TextStyle(color: Color.fromARGB(255, 255, 109, 99)),
          border: InputBorder.none,
          hintText: 'NAME',
          hintStyle: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}

class SurnameField extends StatelessWidget {
  final TextEditingController controller;
  const SurnameField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 200, 205, 230),
                offset: Offset.zero,
                blurRadius: 20)
          ],
          borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
      child: TextFormField(
        maxLines: 1,
        validator: (value) {
          if (value!.isEmpty || !RegExp(r'^[a-zA-z]+$').hasMatch(value)) {
            return 'Enter your Surname';
          } else {
            return null;
          }
        },
        controller: controller,
        cursorColor: const Color.fromARGB(255, 124, 208, 193),
        decoration: const InputDecoration(
            errorStyle: TextStyle(color: Color.fromARGB(255, 255, 109, 99)),
            border: InputBorder.none,
            hintText: 'SURNAME',
            hintStyle: TextStyle(fontSize: 15)),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  const EmailField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 50,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 200, 205, 230),
                offset: Offset.zero,
                blurRadius: 20)
          ],
          borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
      child: TextFormField(
        maxLines: 1,
        controller: controller,
        validator: (value) => validateEmail(value),
        cursorColor: const Color.fromARGB(255, 124, 208, 193),
        decoration: const InputDecoration(
            errorStyle: TextStyle(color: Color.fromARGB(255, 255, 109, 99)),
            border: InputBorder.none,
            hintText: 'EMAIL',
            hintStyle: TextStyle(fontSize: 15)),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  const PasswordField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 50,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 200, 205, 230),
                offset: Offset.zero,
                blurRadius: 20)
          ],
          borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
      child: TextFormField(
          controller: controller,
          validator: (value) => validatePsw(value),
          cursorColor: const Color.fromARGB(255, 124, 208, 193),
          decoration: const InputDecoration(
              errorStyle: TextStyle(color: Color.fromARGB(255, 255, 109, 99)),
              border: InputBorder.none,
              hintText: 'PASSWORD',
              hintStyle: TextStyle(fontSize: 15)),
          textInputAction: TextInputAction.done,
          obscureText: true,
          maxLines: 1,
          autofillHints: const [AutofillHints.newPassword]),
    );
  }
}

class RegText extends StatelessWidget {
  const RegText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //transform: Matrix4.translationValues(0, -180, 0),
      transformAlignment: Alignment.center,
      child: const Text(
        'REGISTRATION',
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

class LogInButton extends StatelessWidget {
  const LogInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromARGB(255, 214, 225, 255))),
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        child: RichText(
          text: const TextSpan(
            text: 'Log In',
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

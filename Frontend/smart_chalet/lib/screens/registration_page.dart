import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'home_page.dart';
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
              transform: Matrix4.translationValues(1, 10, 0),
              child: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 214, 225, 255),
        title: Row(
          children: [
            Container(
              width: 10.w,
              height: 10.h,
              transform: Matrix4.translationValues(-10, 10, 0),
              child: Image.asset(
                'assets/images/Title_2.png',
                height: 40,
                width: 40,
              ),
            ),
            Container(
              transform: Matrix4.translationValues(-10, 5, 0),
              child: Text(
                "Smart-Chalet",
                style: TextStyle(
                    color: const Color.fromARGB(255, 65, 148, 134),
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1,
                    fontFamily: 'AvocadoCreamy',
                    fontSize: 30.sp,
                    height: 1.5),
              ),
            ),
            Container(
              width: 8.w,
              height: 8.h,
              transform: Matrix4.translationValues(-20, 25, 0),
              child: Image.asset(
                'assets/images/Title_1.png',
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: const [
            HeaderImageRound(),
            Lights(),
            //Clock(),
            RegText(),
            FooterGradient(position: -20),
            NameField(),
            SurnameField(),
            EmailField(position: -705),
            PasswordField(position: -685),
            HumanHomeModern(position: -740),
            //StandingHuman(),
            RegButton(position: -1030),
            LogInButton(position: -1035)
          ],
        ),
      ),
    );
  }
}

class HeaderImageRound extends StatelessWidget {
  const HeaderImageRound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      transform: Matrix4.translationValues(0, -100, 0),
      child: Image.asset(
        'assets/images/pattern-background-mobile_over.png',
        //fit: BoxFit.cover,
      ),
    );
  }
}

class Lights extends StatelessWidget {
  const Lights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 50,
      transform: Matrix4.translationValues(-130, -160, 0),
      child: Image.asset(
        'assets/images/HomeModernLights.png',
        color: Colors.white.withOpacity(0.7),
        colorBlendMode: BlendMode.modulate,
        fit: BoxFit.cover,
      ),
    );
  }
}

class RegText extends StatelessWidget {
  const RegText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -180, 0),
      transformAlignment: Alignment.center,
      child: const Text(
        'REGISTRATION',
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

class NameField extends StatelessWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      transform: Matrix4.translationValues(-90, -675, 0),
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 7.5),
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
        cursorColor: const Color.fromARGB(255, 124, 208, 193),
        onFieldSubmitted: (value) {},
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'NAME',
            hintStyle: TextStyle(fontSize: 15)),
      ),
    );
  }
}

class SurnameField extends StatelessWidget {
  const SurnameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      transform: Matrix4.translationValues(90, -725, 0),
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 7.5),
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
        cursorColor: const Color.fromARGB(255, 124, 208, 193),
        decoration: const InputDecoration(
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
  final double position;

  const EmailField({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 50,
      transform: Matrix4.translationValues(0, position, 0),
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 7.5),
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
        cursorColor: const Color.fromARGB(255, 124, 208, 193),
        decoration: const InputDecoration(
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
  final double position;

  const PasswordField({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 50,
      transform: Matrix4.translationValues(0, position, 0),
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 7.5),
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
          cursorColor: const Color.fromARGB(255, 124, 208, 193),
          decoration: const InputDecoration(
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

class HumanHomeModern extends StatelessWidget {
  final double position;

  const HumanHomeModern({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 600,
      transform: Matrix4.translationValues(-0, position, 0),
      child: Image.asset(
        'assets/images/HomeModernNoLights.png',
        color: Colors.white.withOpacity(0.5),
        colorBlendMode: BlendMode.modulate,
        fit: BoxFit.cover,
      ),
    );
  }
}

class RegButton extends StatelessWidget {
  final double position;

  const RegButton({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, position, 0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 169, 232, 221),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 200, 205, 230),
                offset: Offset.zero,
                blurRadius: 20)
          ],
          border: Border.all(color: const Color.fromARGB(255, 169, 232, 221)),
          borderRadius: const BorderRadius.all(Radius.elliptical(15, 15))),
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: TextButton(
        onPressed: () async {}, //TODO ON PRESSED
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
    );
  }
}

class LogInButton extends StatelessWidget {
  final double position;

  const LogInButton({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, position, 0),
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: TextButton(
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LogInPage()));
        }, //TODO ON PRESSED
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

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'home_page.dart';
import 'registration_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          mainAxisAlignment: MainAxisAlignment.start,
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
              height: 8.h,
              width: 8.w,
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
            LogText(),
            FooterGradient(position: -20),
            EmailField(position: -660),
            PasswordField(position: -640),
            HumanHomeModern(position: -640),
            //StandingHuman(),
            LogButton(position: -970),
            RegButton(position: -973)
          ],
        ),
      ),
    );
  }
}

class LogText extends StatelessWidget {
  const LogText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -170, 0),
      transformAlignment: Alignment.center,
      child: Text(
        'LOGIN',
        style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 17.sp,
            letterSpacing: -1,
            color: const Color.fromARGB(255, 82, 85, 96),
            shadows: const <Shadow>[
              Shadow(
                  color: Color.fromARGB(255, 186, 193, 218),
                  offset: Offset.zero,
                  blurRadius: 20)
            ]),
      ),
    );
  }
}

class LogButton extends StatelessWidget {
  final double position;

  const LogButton({Key? key, required this.position}) : super(key: key);

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
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: TextButton(
        onPressed: () async {}, //TODO ON PRESSED
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
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: TextButton(
        onPressed: () async {
          Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const RegPage()));
        }, //TODO ON PRESSED
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

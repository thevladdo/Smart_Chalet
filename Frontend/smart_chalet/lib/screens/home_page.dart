import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 214, 225, 255),
          title: Row(
            children: [
              Container(
                transform: Matrix4.translationValues(0, 10, 0),
                child: Image.asset(
                  'assets/images/Title_2.png',
                  height: 40,
                  width: 40,
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0, 5, 0),
                child: const Text(
                  "Smart-Chalet",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 148, 134),
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1,
                      fontFamily: 'AvocadoCreamy',
                      fontSize: 40,
                      height: 1.5),
                ),
              ),
              Container(
                transform: Matrix4.translationValues(-10, 25, 0),
                child: Image.asset(
                  'assets/images/Title_1.png',
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                HeaderImage(),
                SittingHuman(),
                HiText(),
                LogInText(),
                FooterGradient(),
                HumanHome(),
                LogInButton(),
              ],
            ),
          ),
        ));
  }
}

/// This Widget contains the RichText of home screen
class LogInText extends StatelessWidget {
  const LogInText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(-30, -250, 0),
      child: RichText(
        text: const TextSpan(
          text: '\n\nREADY TO BOOK\nYOUR ',
          style: TextStyle(
            fontFamily: 'AvenirBook',
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: Color.fromARGB(255, 82, 85, 96),
          ),
          children: <TextSpan>[
            TextSpan(
                text: 'UMBRELLA',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'AvenirBlack',
                  fontWeight: FontWeight.w600,
                )),
            TextSpan(
              text: '?',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
            )
          ],
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}

/// This Widget contains "Hi" text
class HiText extends StatelessWidget {
  const HiText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        transform: Matrix4.translationValues(-140, -190, 0),
        child: const Text('HI!',
            style: TextStyle(
              fontFamily: 'AvenirBook',
              fontWeight: FontWeight.w800,
              fontSize: 50,
              color: Color.fromARGB(255, 82, 85, 96),
            )));
  }
}

/// This Widget represent the LogIn Button
class LogInButton extends StatelessWidget {
  const LogInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -930, 0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 214, 225, 255),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 170, 174, 196),
                offset: Offset.zero,
                blurRadius: 20)
          ],
          border: Border.all(color: const Color.fromARGB(255, 214, 225, 255)),
          borderRadius: const BorderRadius.all(Radius.elliptical(15, 15))),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextButton(
        onPressed: () async {},
        child: RichText(
          text: const TextSpan(
            text: 'START WITH ',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Color.fromARGB(255, 82, 85, 96),
                letterSpacing: -1,
                shadows: <Shadow>[
                  Shadow(
                      color: Color.fromARGB(255, 186, 193, 218),
                      offset: Offset.zero,
                      blurRadius: 20)
                ]),
            children: <TextSpan>[
              TextSpan(
                  text: 'LOGIN',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1)),
              // ### TextSpan(text: 'START WITH LOGIN!'),
            ],
          ),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}

/// This Widget represent the header image
class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 500,
      transform: Matrix4.translationValues(0, -100, 0),
      child: Image.asset(
        'assets/images/pattern-background-mobile_flipped.png',
        //fit: BoxFit.cover,
      ),
    );
  }
}

/// This Widget represent the footer image
class FooterGradient extends StatelessWidget {
  const FooterGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 400,
      transform: Matrix4.translationValues(0, -230, 0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.elliptical(15, 15))),
      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Image.asset(
        'assets/images/Gradient_Home.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

class HumanHome extends StatelessWidget {
  const HumanHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      transform: Matrix4.translationValues(0, -540, 0),
      child: Image.asset(
        'assets/images/Home.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

class SittingHuman extends StatelessWidget {
  const SittingHuman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 60,
      transform: Matrix4.translationValues(140, -220, 0),
      child: Image.asset(
        'assets/images/Humans/Humaaan_DarkGreen.png',
        //'assets/images/Humans/Humaaan_LightGreen.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

class StandingHuman extends StatelessWidget {
  const StandingHuman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 40,
      transform: Matrix4.translationValues(130, -0, 0),
      child: Image.asset(
        'assets/images/Humans/Standing.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

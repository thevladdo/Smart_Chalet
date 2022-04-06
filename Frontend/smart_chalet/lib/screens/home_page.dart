import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 214, 225, 255),
          title: Row(
            children: [
              Image.asset(
                'assets/images/Beach-icon.png',
                width: 60,
                height: 60,
              ),
              const Text(
                "SMARTCHALET",
                style: TextStyle(
                    color: Color.fromARGB(255, 50, 115, 103),
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.5,
                    fontFamily: 'HelveticaBold',
                    height: 2.8),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: const [
              HeaderImage(),
              LogInText(),
              FooterImage(),
              HiText(),
              LogInButton()
            ],
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
      transform: Matrix4.translationValues(30, 0, 0),
      child: RichText(
        text: const TextSpan(
          text: '\n\nREADY TO BOOK\nYOUR ',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30,
              color: Color.fromARGB(255, 82, 85, 96),
              shadows: <Shadow>[
                Shadow(
                    color: Color.fromARGB(255, 186, 193, 218),
                    offset: Offset.zero,
                    blurRadius: 20)
              ]),
          children: <TextSpan>[
            TextSpan(
                text: 'UMBRELLA',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
            TextSpan(
              text: '?',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
            )
          ],
        ),
        textAlign: TextAlign.end,
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
        transform: Matrix4.translationValues(133, -370, 0),
        child: const Text('HI!',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 50,
                color: Color.fromARGB(255, 82, 85, 96),
                shadows: <Shadow>[
                  Shadow(
                      color: Color.fromARGB(255, 186, 193, 218),
                      offset: Offset.zero,
                      blurRadius: 20)
                ])));
  }
}

/// This Widget represent the LogIn Button
class LogInButton extends StatelessWidget {
  const LogInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(45, -200, 0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 214, 225, 255),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 161, 167, 189),
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

/// This Widget represent the footer image (flipped header image)
class FooterImage extends StatelessWidget {
  const FooterImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      transform: Matrix4.rotationX(3),
      transformAlignment: Alignment.bottomCenter,
      child: Image.asset(
        'assets/images/pattern-background-mobile.png',
        fit: BoxFit.cover,
        height: 1000,
        alignment: Alignment.bottomCenter,
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
      height: 200,
      width: 500,
      transform: Matrix4.translationValues(0, -60, 0),
      child: Image.asset(
        'assets/images/pattern-background-mobile.png',
        //fit: BoxFit.cover,
      ),
    );
  }
}

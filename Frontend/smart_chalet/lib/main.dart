import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 217, 224, 253),
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
            children: [
              SizedBox(
                height: 200,
                width: 400,
                child: Image.asset(
                  'assets/images/pattern-background-mobile.png',
                  fit: BoxFit.cover,
                ),
              ),
              const LogInText(),
              Container(
                height: 200,
                width: 400,
                transform: Matrix4.rotationX(9),
                //transform: Matrix4.translationValues(0, 200, 0),
                transformAlignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/pattern-background-mobile.png',
                  fit: BoxFit.cover,
                  height: 1000,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              const HiText()
            ],
          ),
        ));
  }
}

class LogInText extends StatelessWidget {
  const LogInText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(35, -10, 0),
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
            // ### TextSpan(text: 'START WITH LOGIN!'),
          ],
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}

class HiText extends StatelessWidget {
  const HiText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        transform: Matrix4.translationValues(-120, -440, 0),
        child: const Text('HI !',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 50,
                color: Color.fromARGB(255, 255, 255, 255),
                shadows: <Shadow>[
                  Shadow(
                      color: Color.fromARGB(255, 82, 85, 96),
                      offset: Offset.zero,
                      blurRadius: 20)
                ])));
  }
}

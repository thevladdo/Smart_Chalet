import 'package:flutter/material.dart';

class RegPage extends StatelessWidget {
  const RegPage({Key? key}) : super(key: key);

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
            children: const [HeaderImage(), HeaderImageFlipped(), RegText()],
          ),
        ));
  }
}

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 500,
      transform: Matrix4.translationValues(-170, -80, 0),
      child: Image.asset(
        'assets/images/pattern-background-mobile.png',
        //fit: BoxFit.cover,
      ),
    );
  }
}

class HeaderImageFlipped extends StatelessWidget {
  const HeaderImageFlipped({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        transform: Matrix4.translationValues(170, -280, 0),
        child: Container(
          height: 200,
          width: 400,
          transform: Matrix4.rotationY(3),
          transformAlignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/pattern-background-mobile.png',
            fit: BoxFit.cover,
            height: 1000,
            alignment: Alignment.bottomCenter,
          ),
        ));
  }
}

class RegText extends StatelessWidget {
  const RegText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -280, 0),
      transformAlignment: Alignment.center,
      child: Text(
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

import 'package:flutter/material.dart';
import 'package:smart_chalet/screens/home_page.dart';

class RegPage extends StatelessWidget {
  const RegPage({Key? key}) : super(key: key);

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
                transform: Matrix4.translationValues(50, 10, 0),
                child: Image.asset(
                  'assets/images/Title_2.png',
                  height: 40,
                  width: 40,
                ),
              ),
              Container(
                transform: Matrix4.translationValues(50, 5, 0),
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
                transform: Matrix4.translationValues(40, 25, 0),
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
            //physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: const [
                HeaderImageSpec(),
                HeaderImageFlipped(),
                Lights(),
                //Clock(),
                RegText(),
                FooterGradient(position: -200),
                RegFields(),
                HumanHomeModern(),
                //StandingHuman(),
                RegButton(),
              ],
            ),
          ),
        ));
  }
}

class RegFields extends StatelessWidget {
  const RegFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(255, 200, 205, 230),
                    offset: Offset.zero,
                    blurRadius: 20)
              ],
              border:
                  Border.all(color: const Color.fromARGB(255, 169, 232, 221)),
              borderRadius: const BorderRadius.all(Radius.elliptical(15, 15))),
          transform: Matrix4.translationValues(0, 0, 0),
          child: Form(
            child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'NAME',
                    hintStyle: TextStyle(fontSize: 15)),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(255, 200, 205, 230),
                    offset: Offset.zero,
                    blurRadius: 20)
              ],
              border:
                  Border.all(color: const Color.fromARGB(255, 169, 232, 221)),
              borderRadius: const BorderRadius.all(Radius.elliptical(15, 15))),
          transform: Matrix4.translationValues(0, 0, 0),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'SURNAME',
                hintStyle: TextStyle(fontSize: 15)),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.name,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(255, 200, 205, 230),
                    offset: Offset.zero,
                    blurRadius: 20)
              ],
              border:
                  Border.all(color: const Color.fromARGB(255, 169, 232, 221)),
              borderRadius: const BorderRadius.all(Radius.elliptical(15, 15))),
          transform: Matrix4.translationValues(0, 0, 0),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'EMAIL',
                hintStyle: TextStyle(fontSize: 15)),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(255, 200, 205, 230),
                    offset: Offset.zero,
                    blurRadius: 20)
              ],
              border:
                  Border.all(color: const Color.fromARGB(255, 169, 232, 221)),
              borderRadius: const BorderRadius.all(Radius.elliptical(15, 15))),
          transform: Matrix4.translationValues(0, 0, 0),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'PASSWORD',
                hintStyle: TextStyle(fontSize: 15)),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
        ),
      ],
    );
  }
}

class RegButton extends StatelessWidget {
  const RegButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -1130, 0),
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
                shadows: <Shadow>[
                  Shadow(
                      color: Color.fromARGB(255, 186, 193, 218),
                      offset: Offset.zero,
                      blurRadius: 20)
                ]),
          ),
        ),
      ),
    );
  }
}

class HeaderImageSpec extends StatelessWidget {
  const HeaderImageSpec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 500,
      transform: Matrix4.translationValues(-170, -100, 0),
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
        transform: Matrix4.translationValues(170, -300, 0),
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
      transform: Matrix4.translationValues(0, -380, 0),
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

// class StandingHuman extends StatelessWidget {
//   const StandingHuman({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       width: 130,
//       transform: Matrix4.translationValues(10, -830, 0),
//       child: Image.asset(
//         'assets/images/Humans/Standing_DarkGreen_Flipped.png',
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }

class HumanHomeModern extends StatelessWidget {
  const HumanHomeModern({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 500,
      transform: Matrix4.translationValues(0, -830, 0),
      child: Image.asset(
        'assets/images/HomeModernNoLights.png',
        color: Colors.white.withOpacity(0.5),
        colorBlendMode: BlendMode.modulate,
        fit: BoxFit.cover,
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
      transform: Matrix4.translationValues(-130, -360, 0),
      child: Image.asset(
        'assets/images/HomeModernLights.png',
        color: Colors.white.withOpacity(0.7),
        colorBlendMode: BlendMode.modulate,
        fit: BoxFit.cover,
      ),
    );
  }
}

// class Clock extends StatelessWidget {
//   const Clock({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       width: 70,
//       transform: Matrix4.translationValues(100, -150, 0),
//       child: Image.asset(
//         'assets/images/HomeModernClock.png',
//         color: Colors.white.withOpacity(0.7),
//         colorBlendMode: BlendMode.modulate,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }

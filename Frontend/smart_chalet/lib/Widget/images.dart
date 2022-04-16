import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HeaderImageRound extends StatelessWidget {
  const HeaderImageRound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 20.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/pattern-background-mobile_over.png'),
              fit: BoxFit.cover)),
    );
  }
}

class Lights extends StatelessWidget {
  const Lights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/HomeModernLights.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

/// This Widget represent the footer image
class FooterGradient extends StatelessWidget {
  final double position;

  const FooterGradient({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: 100.w,
      transform: Matrix4.translationValues(0, position, 0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Image.asset(
        'assets/images/Gradient_Home.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

class HomeWave extends StatelessWidget {
  const HomeWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 210,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/pattern-background-mobile_flipped.png'),
              fit: BoxFit.cover)),
    );
  }
}

class SittingHuman extends StatelessWidget {
  const SittingHuman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 70,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Humans/Humaaan_DarkGreen.png'),
              fit: BoxFit.cover)),
    );
  }
}

class GradientFooter extends StatelessWidget {
  const GradientFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Gradient_Home.png'),
              fit: BoxFit.cover)),
    );
  }
}

class NoLightsHome extends StatelessWidget {
  const NoLightsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 40.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/HomeModernNoLights.png'),
              fit: BoxFit.cover)),
    );
  }
}

class LeftLeaf extends StatelessWidget {
  const LeftLeaf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.w,
      height: 10.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/Title_2.png'),
        fit: BoxFit.contain,
      )),
    );
  }
}

class RightLeaf extends StatelessWidget {
  const RightLeaf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.w,
      height: 8.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/Title_1.png'),
        fit: BoxFit.contain,
      )),
    );
  }
}

/// This Widget represent the footer overlay image
class HomePlants extends StatelessWidget {
  const HomePlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 40.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Home.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Boat extends StatelessWidget {
  final double opacity;
  const Boat({Key? key, required this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 40.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: opacity,
          image: const AssetImage('assets/images/Voyage/boat.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Luggage extends StatelessWidget {
  final double opacity;
  const Luggage({Key? key, required this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: opacity,
          image: const AssetImage('assets/images/Voyage/luggage.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Oxygen extends StatelessWidget {
  final double opacity;
  const Oxygen({Key? key, required this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 40.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: opacity,
          image: const AssetImage('assets/images/Voyage/oxygen.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Savage extends StatelessWidget {
  final double opacity;
  const Savage({Key? key, required this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 40.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: opacity,
          image: const AssetImage('assets/images/Voyage/savage.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Sunglass extends StatelessWidget {
  final double opacity;
  const Sunglass({Key? key, required this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: opacity,
          image: const AssetImage('assets/images/Voyage/sunglass.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Tshirt extends StatelessWidget {
  final double opacity;
  const Tshirt({Key? key, required this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 40.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: opacity,
          image: const AssetImage('assets/images/Voyage/t-shirt.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

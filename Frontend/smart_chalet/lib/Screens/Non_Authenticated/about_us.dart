import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_chalet/Cubit/app_cubits.dart';
import '../../Widget/images.dart';
import '../../Widget/title_row.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 214, 225, 255),
        title: const TitleStack(),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: 100.w,
            height: 100.h,
          ),
          const Positioned(
            top: -80,
            child: HeaderImageRound(),
          ),
          Positioned(
            bottom: 0,
            width: 100.w,
            child: const GradientFooter(),
          ),
          const Positioned(
            bottom: -10,
            child: SwimGirlImage(opacity: 0.8),
          ),
          Positioned(
            top: 90,
            left: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: const [
                  TitleTextAboutUs(),
                  Text(
                    'Sunbeds rent, deck chairs, umbrellas, bar, '
                    'dog areas, private cabins, showers, '
                    'music and entertainment, '
                    'free WI-FI, '
                    'many sports activities like baby dance, water aerobics, '
                    'zumba, swimming school, tennis...\n'
                    '...and much more!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'AvenirBook', fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 300,
              child: AnimatedButton(
                color: const Color.fromARGB(255, 248, 211, 51),
                height: 45,
                width: 90,
                onPressed: () {
                  BlocProvider.of<AppCubits>(context).backToWelcome();
                },
                child: const Text(
                  'Let\'s Go',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                          color: Color.fromARGB(255, 178, 185, 208),
                          offset: Offset.zero,
                          blurRadius: 20)
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class TitleTextAboutUs extends StatelessWidget {
  const TitleTextAboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'On our beaches \nyou will find many services\n',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'AvenirBook',
          fontWeight: FontWeight.w700,
          fontSize: 21,
          shadows: <Shadow>[
            Shadow(
                color: Color.fromARGB(255, 186, 193, 218),
                offset: Offset.zero,
                blurRadius: 20)
          ]),
    );
  }
}

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../Cubit/app_cubits.dart';
import '../../../Widget/images.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(width: 100.w, height: 210),
              const Positioned(top: -50, child: HomeWave()),
              const AvatarImage(),
              const Positioned(top: 60, right: 80, child: LeftLeaf()),
              const Positioned(top: 165, left: 30, child: DiscoverText()),
            ],
          ),
          Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context)
                                    .getUmbrella();
                              },
                              child: Container(
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                      offset: Offset(-5, 10),
                                      blurRadius: 10,
                                      color: Color.fromARGB(255, 172, 183, 209),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/beach_2.jpg'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            const Positioned(
                                left: 15,
                                top: 15,
                                child: Off(toShow: '20%OFF')),
                          ],
                        ),
                        const BeachNameText(name: 'Maria Beach')
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Stack(
                          children: const [
                            BeachOneImage(),
                            Positioned(
                                left: 15,
                                top: 15,
                                child: Off(toShow: '12%OFF')),
                          ],
                        ),
                        const BeachNameText(name: 'PhoenixBeach')
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Stack(
                          children: const [
                            BeachTwoImage(),
                            Positioned(
                                left: 15,
                                top: 15,
                                child: Off(toShow: '3 LEFT')),
                          ],
                        ),
                        const BeachNameText(name: 'Santa Catrina Beach')
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Stack(
                          children: const [
                            BeachOneImage(),
                            Positioned(
                                left: 15,
                                top: 15,
                                child: Off(toShow: '15%OFF')),
                          ],
                        ),
                        const BeachNameText(name: 'Venice Beach')
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              SizedBox(width: 100.w, height: 166),
              const Positioned(
                  bottom: 46, left: 95, right: 95, child: ButtonShadow()),
              const Positioned(
                  bottom: 46, left: 95, right: 95, child: BookNowButton()),
            ],
          )
        ],
      ),
    );
  }
}

_styleT() {
  return const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    letterSpacing: 0,
    color: Color.fromARGB(255, 97, 100, 113),
    shadows: <Shadow>[
      Shadow(
          color: Color.fromARGB(255, 195, 199, 216),
          offset: Offset.zero,
          blurRadius: 50)
    ],
  );
}

class Off extends StatelessWidget {
  final String toShow;
  const Off({Key? key, required this.toShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 60,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Text(
        toShow,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 11,
            color: Color.fromARGB(153, 0, 0, 0),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  const AvatarImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 70, left: 20),
      child: Row(
        children: [
          // const Icon(
          //   Icons.home_rounded,
          //   color: Color.fromARGB(255, 139, 146, 176),
          // ),
          const Expanded(child: SizedBox()),
          Container(
            margin: const EdgeInsets.only(right: 30, top: 10),
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/avatar.png')),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
    );
  }
}

class DiscoverText extends StatelessWidget {
  const DiscoverText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Discover',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Helvetica',
        fontWeight: FontWeight.w800,
        fontSize: 30,
        letterSpacing: 0,
        color: Color.fromARGB(255, 97, 100, 113),
        // shadows: <Shadow>[
        //   Shadow(
        //       color: Color.fromARGB(255, 186, 193, 218),
        //       offset: Offset.zero,
        //       blurRadius: 20)
        // ],
      ),
    );
  }
}

class BeachNameText extends StatelessWidget {
  final String name;

  const BeachNameText({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        name,
        style: _styleT(),
      ),
    );
  }
}

class BeachOneImage extends StatelessWidget {
  const BeachOneImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(-5, 10),
            blurRadius: 10,
            color: Color.fromARGB(255, 172, 183, 209),
          )
        ],
        image: const DecorationImage(
            image: AssetImage('assets/images/beach_1.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}

class BeachTwoImage extends StatelessWidget {
  const BeachTwoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(-5, 10),
            blurRadius: 10,
            color: Color.fromARGB(255, 172, 183, 209),
          )
        ],
        image: const DecorationImage(
            image: AssetImage('assets/images/beach_2.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}

class ButtonShadow extends StatelessWidget {
  const ButtonShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 30,
            color: Color.fromARGB(255, 194, 206, 234),
          )
        ],
      ),
    );
  }
}

class BookNowButton extends StatelessWidget {
  const BookNowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      color: const Color.fromARGB(255, 210, 221, 253),
      onPressed: () {
        BlocProvider.of<AppCubits>(context).getUmbrella();
      },
      child: const Text(
        'BOOK NOW',
        style: TextStyle(
          shadows: <Shadow>[
            Shadow(
                color: Color.fromARGB(255, 89, 100, 141),
                offset: Offset.zero,
                blurRadius: 100)
          ],
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 22,
        ),
      ),
    );
  }
}

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_chalet/Screens/detail_page.dart';
import '../Widget/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 210,
              ),
              const Positioned(
                top: -50,
                child: HomeWave(),
              ),
              // const Positioned(
              //   top: 130,
              //   left: 10,
              //   width: 70,
              //   height: 70,
              //   child: Sunglass(opacity: 0.5),
              // ),
              Container(
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
              ),
              const Positioned(
                top: 60,
                right: 80,
                child: LeftLeaf(),
              ),
              const Positioned(
                top: 165,
                left: 30,
                child: Text(
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
                ),
              ),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DetailPage(),
                                  ),
                                );
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
                              child: Off(toShow: '20%OFF'),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Maria Beach',
                            style: _styleT(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
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
                                    image:
                                        AssetImage('assets/images/beach_1.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const Positioned(
                              left: 15,
                              top: 15,
                              child: Off(toShow: '12%OFF'),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Phoenix Beach',
                            style: _styleT(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
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
                                    image:
                                        AssetImage('assets/images/beach_2.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const Positioned(
                              left: 15,
                              top: 15,
                              child: Off(toShow: '3 LEFT'),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Santa Catrina Beach',
                            style: _styleT(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
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
                                    image:
                                        AssetImage('assets/images/beach_1.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const Positioned(
                              left: 15,
                              top: 15,
                              child: Off(toShow: '15%OFF'),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Vanice Beach',
                            style: _styleT(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 166,
              ),
              Positioned(
                bottom: 46,
                left: 95,
                right: 95,
                child: AnimatedButton(
                  color: const Color.fromARGB(255, 210, 221, 253),
                  onPressed: () {},
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
                ),
              )
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

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_chalet/Screens/home_page.dart';
import 'package:smart_chalet/Widget/icons_buttons.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _mainPageColor = const Color.fromARGB(255, 156, 177, 241);
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: 100.w,
                height: 360,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/beach_2.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              top: 70,
              left: 20,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.menu_open),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 330,
              child: Container(
                padding: const EdgeInsets.only(left: 30, top: 35, right: 30),
                width: 100.w,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Maria Beach',
                          style: TextStyle(
                            fontFamily: 'Avenir Black',
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            letterSpacing: -1,
                            color: Color.fromARGB(210, 23, 24, 27),
                          ),
                        ),
                        Text(
                          '€ 250',
                          style: TextStyle(
                            fontFamily: 'Avenir Black',
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            letterSpacing: -1,
                            color: _mainPageColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: _mainPageColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'USA, California',
                          style: TextStyle(
                            fontFamily: 'Avenir Black',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            letterSpacing: -1,
                            color: _mainPageColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < gottenStars
                                  ? Icons.star_rounded
                                  : Icons.star_outline_rounded,
                              color: index < gottenStars
                                  ? const Color.fromARGB(255, 228, 190, 1)
                                  : Colors.black38,
                            ),
                          ),
                        ),
                        const Text(
                          '(4.0)',
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 35),
                    const Text(
                      'People',
                      style: TextStyle(
                        fontFamily: 'Avenir Black',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        letterSpacing: -1,
                        color: Color.fromARGB(210, 23, 24, 27),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Number of people in your group',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0,
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      children: List.generate(
                          6,
                          (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: SqaureButton(
                                    size: 45,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : const Color.fromARGB(113, 0, 0, 0),
                                    backgroundColor: selectedIndex == index
                                        ? _mainPageColor
                                        : const Color.fromARGB(
                                            53, 208, 217, 245),
                                    borderColor: selectedIndex == index
                                        ? _mainPageColor
                                        : const Color.fromARGB(
                                            0, 208, 217, 245),
                                    text: index < 5
                                        ? (index + 1).toString()
                                        : '+',
                                  ),
                                ),
                              )),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 40,
                left: 30,
                right: 30,
                child: Row(
                  children: [
                    SqaureButton(
                      size: 60,
                      color: _mainPageColor,
                      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                      borderColor: _mainPageColor,
                      isIcon: true,
                      icon: Icons.arrow_back_ios_new_rounded,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ArrowsButton(
                      color: const Color.fromARGB(255, 147, 182, 253),
                      isResponsive: true,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

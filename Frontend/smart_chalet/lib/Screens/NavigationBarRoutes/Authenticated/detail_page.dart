import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_chalet/Cubit/app_cubit_states.dart';
import 'package:smart_chalet/Cubit/app_cubits.dart';
import 'package:smart_chalet/Model/umbrella.dart';
import 'package:smart_chalet/Widget/icons_buttons.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  int price = 250;

  @override
  Widget build(BuildContext context) {
    //With BlocBuilder we can access the states
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var umbrellas = state.loaded;

          int totalUmbrellas = umbrellas.length;

          int disponibility = 0;

          for (Umbrella u in umbrellas) {
            if (u.disponibility == true) disponibility++;
          }

          return Scaffold(
            body: SizedBox(
              height: 100.h,
              width: 100.w,
              child: Stack(
                children: [
                  const Positioned(left: 0, right: 0, child: BackgroundImage()),
                  Positioned(
                      top: 70,
                      left: 20,
                      child: Row(children: const [TopButton()])),
                  Positioned(
                    top: 330,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 30, top: 35, right: 30),
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
                                const BeachNameText(),
                                Price(
                                  price: price,
                                  selectedIndex: selectedIndex,
                                )
                              ]),
                          const SizedBox(height: 5),
                          Row(
                            children: const [
                              Icon(
                                Icons.location_on_rounded,
                                color: _mainPageColor,
                              ),
                              SizedBox(width: 5),
                              PositionText(),
                              SizedBox(width: 105),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(children: [
                            Stars(
                              gottenStars: gottenStars,
                            ),
                            const Text('(4.0)',
                                style: TextStyle(color: Colors.black38))
                          ]),
                          const SizedBox(height: 25),
                          const ParagraphTitle(text: 'People'),
                          const SizedBox(height: 5),
                          const SubParagraphText(
                              text: 'Number of people in your group'),
                          const SizedBox(height: 15),
                          Wrap(
                            children: List.generate(
                              6,
                              (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    _updatePrice(index);
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: SqaureButton(
                                    size: 45,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : const Color.fromARGB(113, 0, 0, 0),
                                    backgroundColor: (selectedIndex == index)
                                        ? (selectedIndex < disponibility * 2
                                            ? _mainPageColor
                                            : const Color.fromARGB(
                                                255, 226, 101, 92))
                                        : const Color.fromARGB(
                                            53, 208, 217, 245),
                                    borderColor: selectedIndex == index
                                        ? (selectedIndex < disponibility * 2
                                            ? _mainPageColor
                                            : const Color.fromARGB(
                                                255, 226, 101, 92))
                                        : const Color.fromARGB(
                                            0, 208, 217, 245),
                                    text: index < 5
                                        ? (index + 1).toString()
                                        : '+',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const ParagraphTitle(text: 'Details'),
                          const SizedBox(height: 5),
                          const SubParagraphText(
                            text:
                                'Maria Beach is one of the most exotic beaches in the Mediterranean Sea. Full of tasty buffets and unique drinks, it awaits you for your holiday',
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 40,
                      left: 30,
                      right: 30,
                      child: Row(children: [
                        GestureDetector(
                          onTap: (() {
                            BlocProvider.of<AppCubits>(context).jumpHome();
                          }),
                          child: SqaureButton(
                              size: 60,
                              color: _mainPageColor,
                              backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                              borderColor: _mainPageColor,
                              isIcon: true,
                              icon: Icons.arrow_back_ios_new_rounded),
                        ),
                        const SizedBox(width: 30),
                        const ArrowButton()
                      ])),
                  Positioned(
                      top: 407,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: FreeSeatsText(
                            disponibility: disponibility,
                            totalUmbrellas: totalUmbrellas),
                      )),
                ],
              ),
            ),
          );
        } else {
          return Container(); //TODO CREATE CONNECTION ERROR SCREEN
        }
      },
    );
  }

  void _updatePrice(int index) {
    price = (250 * (index + 1));
  }
}

const _mainPageColor = Color.fromARGB(255, 156, 177, 241);

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 360,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/beach_2.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}

class TopButton extends StatelessWidget {
  const TopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<AppCubits>(context).jumpHome();
      },
      icon: const Icon(Icons.menu_open),
      color: Colors.white,
    );
  }
}

class BeachNameText extends StatelessWidget {
  const BeachNameText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Maria Beach',
      style: TextStyle(
        fontFamily: 'Avenir Black',
        fontWeight: FontWeight.w700,
        fontSize: 25,
        letterSpacing: -1,
        color: Color.fromARGB(210, 23, 24, 27),
      ),
    );
  }
}

class Price extends StatelessWidget {
  final int price;
  final selectedIndex;
  const Price({Key? key, required this.price, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      (selectedIndex == 5) ? "€ 250/P" : "€ " + price.toString(),
      style: const TextStyle(
        fontFamily: 'Avenir Black',
        fontWeight: FontWeight.w700,
        fontSize: 25,
        letterSpacing: -1,
        color: _mainPageColor,
      ),
    );
  }
}

class PositionText extends StatelessWidget {
  const PositionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'USA, California',
      style: TextStyle(
        fontFamily: 'Avenir Black',
        fontWeight: FontWeight.w500,
        fontSize: 15,
        letterSpacing: -1,
        color: _mainPageColor,
      ),
    );
  }
}

class FreeSeatsText extends StatelessWidget {
  final int disponibility;
  final int totalUmbrellas;

  const FreeSeatsText(
      {Key? key, required this.disponibility, required this.totalUmbrellas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Total Umbrellas $totalUmbrellas \nFree Seats $disponibility',
      textAlign: TextAlign.end,
      style: const TextStyle(
        fontFamily: 'Avenir Black',
        fontWeight: FontWeight.w500,
        fontSize: 15,
        letterSpacing: -1,
        color: Color.fromARGB(255, 199, 209, 239),
      ),
    );
  }
}

class Stars extends StatelessWidget {
  final int gottenStars;
  const Stars({Key? key, required this.gottenStars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        5,
        (index) => Icon(
          index < gottenStars ? Icons.star_rounded : Icons.star_outline_rounded,
          color: index < gottenStars
              ? const Color.fromARGB(255, 228, 190, 1)
              : Colors.black38,
        ),
      ),
    );
  }
}

class ParagraphTitle extends StatelessWidget {
  final String text;

  const ParagraphTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Avenir Black',
        fontWeight: FontWeight.w700,
        fontSize: 20,
        letterSpacing: -1,
        color: Color.fromARGB(210, 23, 24, 27),
      ),
    );
  }
}

class SubParagraphText extends StatelessWidget {
  final String text;

  const SubParagraphText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        letterSpacing: 0,
        color: Colors.black38,
      ),
    );
  }
}

class ArrowButton extends StatelessWidget {
  const ArrowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArrowsButton(
      color: const Color.fromARGB(255, 147, 182, 253),
      isResponsive: true,
    );
  }
}

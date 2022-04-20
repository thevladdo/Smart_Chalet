import 'package:flutter/material.dart';

import '../../../Widget/images.dart';
import '../../../Widget/title_row.dart';

class BarPage extends StatelessWidget {
  const BarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 214, 225, 255),
          title: const TitleStack(),
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: const [
            Positioned(top: -80, child: HeaderImageRound()),
            Positioned(
              top: 100,
              child: Icon(
                Icons.location_on_rounded,
                color: _mainPageColor,
              ),
            ),
            Positioned(
                top: 160,
                child: Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Text(
                    'BAR PAGE IS AVAILABLE\nONLY IN BEACH LOCATION',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Avenir Black',
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                        letterSpacing: 0,
                        color: Color.fromARGB(255, 35, 47, 86),
                        shadows: <Shadow>[
                          Shadow(
                              color: Color.fromARGB(255, 186, 193, 218),
                              offset: Offset.zero,
                              blurRadius: 20)
                        ]),
                  ),
                )),
            Positioned(
                top: 300, width: 300, height: 300, child: Sunglass(opacity: 1)),
          ],
        ));
  }
}

const _mainPageColor = Color.fromARGB(255, 156, 177, 241);

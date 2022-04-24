import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'images.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10.w,
          height: 10.h,
          transform: Matrix4.translationValues(-5, 10, 0),
          child: Image.asset(
            'assets/images/Title_2.png',
            height: 40,
            width: 40,
          ),
        ),
        Container(
          transform: Matrix4.translationValues(-5, 5, 0),
          child: Text(
            "Smart-Chalet",
            style: TextStyle(
                color: const Color.fromARGB(255, 65, 148, 134),
                fontWeight: FontWeight.w500,
                letterSpacing: -1,
                fontFamily: 'AvocadoCreamy',
                fontSize: 30.sp,
                height: 1.5),
          ),
        ),
        Container(
          width: 8.w,
          height: 8.h,
          transform: Matrix4.translationValues(-15, 25, 0),
          child: Image.asset(
            'assets/images/Title_1.png',
            height: 30,
            width: 30,
          ),
        ),
      ],
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Smart-Chalet",
      style: TextStyle(
          color: const Color.fromARGB(255, 65, 148, 134),
          fontWeight: FontWeight.w500,
          letterSpacing: -1,
          fontFamily: 'AvocadoCreamy',
          fontSize: 30.sp,
          height: 1.5),
    );
  }
}

class TitleStack extends StatelessWidget {
  const TitleStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: const [
        SizedBox(
          width: 250,
          height: 100,
        ),
        Positioned(
          bottom: 0,
          left: -4,
          child: LeftLeaf(),
        ),
        Positioned(
          bottom: 17,
          child: HeaderText(),
        ),
        Positioned(
          bottom: -8,
          right: 13,
          child: RightLeaf(),
        ),
      ],
    );
  }
}

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_chalet/Cubit/app_cubits.dart';
import '../../../Widget/images.dart';
import '../../../Widget/title_row.dart';

class ErrorPageLogin extends StatelessWidget {
  const ErrorPageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 214, 225, 255),
          title: const TitleStack(),
        ),
        body: Stack(alignment: Alignment.topCenter, children: [
          SizedBox(height: 100.h, width: 100.w),
          const Positioned(bottom: 0, child: GradientFooter()),
          const Positioned(top: -80, child: HeaderImageRound()),
          const Positioned(top: 230, child: Savage(opacity: 0.6)),
          const Positioned(top: 100, child: ReserveText()),
          const Positioned(top: 570, child: GoLoginBottom()),
        ]));
  }
}

class ReserveText extends StatelessWidget {
  const ReserveText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'OPS..\nwe have a problem\nwith your login...',
        style: TextStyle(
            fontFamily: 'AvenirBook',
            fontWeight: FontWeight.w700,
            fontSize: 22.sp,
            color: const Color.fromARGB(255, 82, 85, 96),
            shadows: const <Shadow>[
              Shadow(
                  color: Color.fromARGB(255, 186, 193, 218),
                  offset: Offset.zero,
                  blurRadius: 20)
            ]),
      ),
      textAlign: TextAlign.center,
    );
  }
}

class GoLoginBottom extends StatelessWidget {
  const GoLoginBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      height: 60,
      width: 170,
      color: const Color.fromARGB(255, 169, 232, 221),
      onPressed: () async {
        BlocProvider.of<AppCubits>(context).register();
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Text(
          'Try to Register',
          style: TextStyle(
            shadows: <Shadow>[
              Shadow(
                  color: Color.fromARGB(255, 89, 100, 141),
                  offset: Offset.zero,
                  blurRadius: 100)
            ],
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

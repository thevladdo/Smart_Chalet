import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../Cubit/app_cubits.dart';
import '../../Widget/images.dart';
import '../../Widget/title_row.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 214, 225, 255),
          title: const TitleStack(),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 150,
                  ),
                  const Positioned(
                    top: -80,
                    child: HomeWave(),
                  ),
                  const Positioned(
                    right: 30,
                    bottom: 40,
                    child: SittingHuman(),
                  )
                ],
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 650,
                  ),
                  Positioned(
                    top: 200,
                    width: 100.w,
                    child: const GradientFooter(),
                  ),
                  const Positioned(
                    top: 280,
                    child: HomePlants(),
                  ),
                  const Positioned(
                    left: 30,
                    child: HiText(),
                  ),
                  const Positioned(
                    left: 30,
                    child: LogInText(),
                  ),
                  const Positioned(
                    bottom: 350,
                    left: 75,
                    right: 75,
                    child: StartLogInButton(),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

/// This Widget contains "Hi" text
class HiText extends StatelessWidget {
  const HiText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('HI!',
        style: TextStyle(
          fontFamily: 'AllRound',
          fontWeight: FontWeight.w800,
          fontSize: 39.sp,
          color: const Color.fromARGB(255, 82, 85, 96),
        ));
  }
}

/// This Widget contains the RichText of home screen
class LogInText extends StatelessWidget {
  const LogInText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '\n\nREADY TO BOOK\nYOUR ',
        style: TextStyle(
          fontFamily: 'AvenirBook',
          fontWeight: FontWeight.w700,
          fontSize: 24.sp,
          color: const Color.fromARGB(255, 82, 85, 96),
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'UMBRELLA',
              style: TextStyle(
                fontSize: 24.sp,
                fontFamily: 'AvenirBlack',
                fontWeight: FontWeight.w600,
              )),
          TextSpan(
            text: '?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24.sp),
          )
        ],
      ),
      textAlign: TextAlign.start,
    );
  }
}

/// This Widget represent the LogIn Button
class StartLogInButton extends StatelessWidget {
  const StartLogInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 214, 225, 255),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 170, 174, 196),
                offset: Offset.zero,
                blurRadius: 20)
          ],
          border: Border.all(color: const Color.fromARGB(255, 214, 225, 255)),
          borderRadius: const BorderRadius.all(Radius.elliptical(15, 15))),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromARGB(255, 214, 225, 255))),
        onPressed: () async {
          BlocProvider.of<AppCubits>(context).register();
        },
        child: RichText(
          text: const TextSpan(
            text: 'START WITH ',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Color.fromARGB(255, 82, 85, 96),
                letterSpacing: -1,
                shadows: <Shadow>[
                  Shadow(
                      color: Color.fromARGB(255, 186, 193, 218),
                      offset: Offset.zero,
                      blurRadius: 20)
                ]),
            children: <TextSpan>[
              TextSpan(
                  text: 'LOGIN',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1)),
              // ### TextSpan(text: 'START WITH LOGIN!'),
            ],
          ),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}

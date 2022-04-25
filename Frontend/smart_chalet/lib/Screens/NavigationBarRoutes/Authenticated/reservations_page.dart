import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_chalet/Model/umbrella.dart';
import 'package:smart_chalet/Screens/NavigationBarRoutes/Authenticated/detail_page.dart';
import '../../../Cubit/app_cubit_states.dart';
import '../../../Cubit/app_cubits.dart';
import '../../../Model/reservation.dart';
import '../../../Widget/icons_buttons.dart';
import '../../../Widget/images.dart';
import '../../../Widget/title_row.dart';

class ReservationsList extends StatelessWidget {
  const ReservationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedResState) {
        Reservation res = state.res;
        String userId = res.getUserId;
        String dateToSub = res.getDate.toString();
        String date = dateToSub.substring(0, 16);
        List<Umbrella> list = res.getUmbrellas;
        int umbrellas = list.length;

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 214, 225, 255),
            title: const TitleStack(),
          ),
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(width: 100.w, height: 100.h),
              const Positioned(top: -100, child: HomeWave()),
              const Positioned(top: -45, right: 10, child: AvatarImage()),
              const Positioned(top: 120, left: 36, child: ReservationText()),
              Positioned(
                  top: 200,
                  child: ReservationResult(
                    date: date,
                    userId: userId,
                    umbrellas: umbrellas,
                  )),
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
                    ArrowButton(
                        text: 'Reserve now',
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).getUmbrella();
                        })
                  ])),
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }
}

const _mainPageColor = Color.fromARGB(255, 156, 177, 241);

class ReservationResult extends StatelessWidget {
  final String userId;
  final String date;
  final int umbrellas;

  const ReservationResult({
    Key? key,
    required this.userId,
    required this.date,
    required this.umbrellas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int loungers = umbrellas * 2;
    return Container(
      width: 80.w,
      height: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Color.fromARGB(255, 222, 226, 249),
              offset: Offset.zero,
              blurRadius: 50)
        ],
      ),
      child: Container(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ParagraphTitle(TextAlign.center, text: 'Your Reservation'),
            const SizedBox(height: 25),
            const Text(
              'Your ID',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Avenir Black',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromARGB(210, 23, 24, 27),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              userId,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Avenir Black',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color.fromARGB(210, 35, 36, 41),
              ),
            ),
            const SizedBox(height: 35),
            const Text(
              'Date',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Avenir Black',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromARGB(210, 23, 24, 27),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              date,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Avenir Black',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color.fromARGB(210, 35, 36, 41),
              ),
            ),
            const SizedBox(height: 35),
            const Text(
              'Umbrellas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Avenir Black',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromARGB(210, 23, 24, 27),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '$umbrellas umbrellas with\n$loungers loungers',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Avenir Black',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color.fromARGB(210, 35, 36, 41),
              ),
            ),
          ],
        ),
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
      child: Container(
        margin: const EdgeInsets.only(right: 30, top: 10),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/avatar.png')),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

class ReservationText extends StatelessWidget {
  const ReservationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Reservations',
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: 'Helvetica',
        fontWeight: FontWeight.w800,
        fontSize: 30,
        letterSpacing: 0,
        color: Color.fromARGB(255, 97, 100, 113),
        shadows: <BoxShadow>[
          BoxShadow(
              color: Color.fromARGB(255, 222, 226, 249),
              offset: Offset.zero,
              blurRadius: 50)
        ],
      ),
    );
  }
}

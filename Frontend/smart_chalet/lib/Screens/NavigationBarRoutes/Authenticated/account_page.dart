// ignore_for_file: unused_local_variable

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_chalet/Utilities/account_details.dart';
import '../../../Cubit/app_cubits.dart';
import '../../../Widget/images.dart';
import '../../../Widget/title_row.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = GlobUser.name;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 214, 225, 255),
        title: const TitleStack(),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 280,
            child: Tshirt(opacity: 0.3),
            width: 200,
            height: 200,
          ),
          const Positioned(top: -80, child: HeaderImageRound()),
          const Positioned(
            top: 80,
            child: AvatarPhoto(),
          ),
          Positioned(
              top: 220,
              child: Text('Hey $name,',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Avenir Black',
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                      letterSpacing: 0,
                      color: _mainPageColor,
                      shadows: <Shadow>[
                        Shadow(
                            color: Color.fromARGB(255, 218, 226, 254),
                            offset: Offset.zero,
                            blurRadius: 20)
                      ]))),
          const Positioned(
              top: 260,
              child: Text(
                'we\'re glad to have you here',
                style: TextStyle(color: _mainPageColor),
              )),
          const Positioned(top: 440, left: 50, child: LeftLeaf()),
          const Positioned(top: 490, right: 65, child: RightLeaf()),
          const Positioned(top: 470, child: ReservationUserButton()),
          const Positioned(top: 560, child: LogOutButton()),
        ],
      ),
    );
  }
}

const _mainPageColor = Color.fromARGB(255, 156, 177, 241);

class AvatarPhoto extends StatelessWidget {
  const AvatarPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 105,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage('assets/images/avatar.png')),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}

// class DetailBox extends StatelessWidget {
//   final String text;
//   const DetailBox({Key? key, required this.text}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 10, right: 10, top: 11),
//       width: 70.w,
//       height: 50,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.white,
//         boxShadow: const <BoxShadow>[
//           BoxShadow(
//               color: Color.fromARGB(255, 230, 235, 252),
//               offset: Offset.zero,
//               blurRadius: 100)
//         ],
//       ),
//       child: Text(
//         text,
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           fontFamily: 'Avenir Black',
//           fontWeight: FontWeight.w700,
//           fontSize: 20,
//           letterSpacing: 0,
//           color: Color.fromARGB(255, 122, 136, 180),
//         ),
//       ),
//     );
//   }
// }

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      height: 50,
      width: 100,
      color: const Color.fromARGB(255, 251, 127, 118),
      onPressed: () async {
        BlocProvider.of<AppCubits>(context).logOut();
      },
      child: const Text(
        'Logout',
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
    );
  }
}

class ReservationUserButton extends StatelessWidget {
  const ReservationUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      color: Colors.white,
      onPressed: () {
        BlocProvider.of<AppCubits>(context).getReservation();
      },
      child: const Text(
        'My Reservations',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Avenir Black',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          letterSpacing: 0,
          color: Color.fromARGB(255, 122, 136, 180),
        ),
      ),
    );
  }
}

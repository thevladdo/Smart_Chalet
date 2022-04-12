import 'package:flutter/material.dart';
import 'package:smart_chalet/Screens/home_page.dart';

class IconBackButton extends StatelessWidget {
  const IconBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Container(
          transform: Matrix4.translationValues(1, 10, 0),
          child: const Icon(Icons.arrow_back_ios_new_rounded)),
    );
  }
}

class IconHomeButton extends StatelessWidget {
  const IconHomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      },
      icon: Container(
          transform: Matrix4.translationValues(1, 10, 0),
          child: const Icon(Icons.arrow_back_ios_new_rounded)),
    );
  }
}

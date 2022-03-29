import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Smart Chalet"),
            centerTitle: true,
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 217, 224, 253),
            titleTextStyle: const TextStyle(
                color: Color.fromARGB(255, 55, 70, 94),
                fontWeight: FontWeight.w700,
                fontSize: 17,
                wordSpacing: 2),
          ),
          body: Center(
            child: Container(
              height: 200,
              width: 400,
              transform: Matrix4.translationValues(0, -300, 0),
              child: Image.asset(
                'assets/images/pattern-background-mobile.png',
                fit: BoxFit.cover,
              ),
            ),
          )),
    );
  }
}

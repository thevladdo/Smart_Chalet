import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 217, 224, 253),
            title: Row(
              children: [
                Image.asset(
                  'assets/images/Beach-icon.png',
                  width: 60,
                  height: 60,
                ),
                const Text(
                  "SMARTCHALET",
                  style: TextStyle(
                      color: Color.fromARGB(255, 50, 115, 103),
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1.5,
                      fontFamily: 'HelveticaBold',
                      height: 2.8),
                ),
              ],
            ),
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

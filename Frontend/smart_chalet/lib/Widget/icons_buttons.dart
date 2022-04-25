// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_chalet/Screens/Non_Authenticated/welcome_page.dart';

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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WelcomePage()));
      },
      icon: Container(
          transform: Matrix4.translationValues(1, 10, 0),
          child: const Icon(Icons.arrow_back_ios_new_rounded)),
    );
  }
}

class SqaureButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  String? text;
  IconData? icon;
  Color? iconColor;
  double size;
  bool? isIcon;

  SqaureButton(
      {Key? key,
      this.iconColor = Colors.black,
      this.isIcon = false,
      this.text = 'Hi',
      this.icon = Icons.home_rounded,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: isIcon == false
          ? Center(
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                  color: color,
                ),
              ),
            )
          : Center(
              child: Icon(
                icon!,
                color: color,
              ),
            ),
    );
  }
}

class ArrowsButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  Color color;
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  var onTap;

  ArrowsButton({
    Key? key,
    this.onTap,
    this.isResponsive = false,
    this.width = 120,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Flexible shoud be wrapped around whit row or columns
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: isResponsive == true ? 100.w : width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 5),
            child: Row(
              mainAxisAlignment: isResponsive == true
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                isResponsive == true
                    ? Text(
                        text,
                        style: const TextStyle(
                          fontSize: 15,
                          letterSpacing: 0,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
                Image.asset('assets/images/button_arrow.png')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

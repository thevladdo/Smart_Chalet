import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Color.fromARGB(255, 214, 225, 255),
      ),
    );
  }
}

class InkDropIndicator extends StatelessWidget {
  const InkDropIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white.withOpacity(0.4),
          child: LoadingAnimationWidget.inkDrop(
            color: const Color.fromARGB(255, 119, 155, 254),
            size: 50,
          ),
        ),
      ),
    );
  }
}

class TriangleDotIndicator extends StatelessWidget {
  const TriangleDotIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 100.w,
      heightFactor: 100.h,
      child: Container(
        color: Colors.white.withOpacity(0.4),
        child: LoadingAnimationWidget.halfTriangleDot(
          color: const Color.fromARGB(255, 119, 155, 254),
          size: 50,
        ),
      ),
    );
  }
}

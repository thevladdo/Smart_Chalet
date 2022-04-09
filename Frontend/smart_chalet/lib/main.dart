import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_chalet/screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }));
}

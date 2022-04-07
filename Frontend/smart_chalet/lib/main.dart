import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: unused_import
import 'package:smart_chalet/screens/home_page.dart';
// ignore: unused_import
import 'package:smart_chalet/screens/registration_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MaterialApp(
    home: RegPage(),
  ));
}

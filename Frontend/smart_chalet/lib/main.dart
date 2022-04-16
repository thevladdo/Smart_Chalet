import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_chalet/Cubit/app_cubit_logics.dart';
import 'package:smart_chalet/Cubit/app_cubits.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocProvider<AppCubits>(
            create: ((context) => AppCubits()),
            //Child that can acces the cubits
            child: const AppCubitLogics(),
          ),
        );
      },
    ),
  );
}

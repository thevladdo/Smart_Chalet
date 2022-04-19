import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'Cubit/app_cubit_logics.dart';
import 'Cubit/app_cubits.dart';
import 'Services/umbrella_service.dart';

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
            create: ((context) => AppCubits(
                  umbrella: UmbrellaService(),
                )),
            //Child that can acces the cubits, is the BlocBuilder with logic
            child: const AppCubitLogics(),
          ),
        );
      },
    ),
  );
}

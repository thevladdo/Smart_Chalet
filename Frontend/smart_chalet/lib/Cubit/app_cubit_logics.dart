import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_chalet/Cubit/app_cubit_states.dart';
import 'package:smart_chalet/Cubit/app_cubits.dart';
import 'package:smart_chalet/Screens/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Build the logic with this: if the state is this -> show me that
      //BlocBuilder shold know the cubits
      body: BlocBuilder<AppCubits, CubitStates>(
          //Using this builder we can check on the states
          builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        } else {
          return Container();
        }
      }),
    );
  }
}

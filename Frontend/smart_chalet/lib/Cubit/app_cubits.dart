// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_chalet/Cubit/app_cubit_states.dart';
import 'package:smart_chalet/Services/umbrella_service.dart';

class AppCubits extends Cubit<CubitStates> {
  // When the initialization of the page (InitialState) will be done, then...
  AppCubits({required this.umbrella}) : super(InitialState()) {
    // ..trigger this state
    emit(WelcomeState());
  }

  final UmbrellaService
      umbrella; //Oggetto Umbrella che attendo dalla chiamata di getData
  late final umbrellas; //dynamic che può assumere qualsiasi tipo in base al contesto

  Future<void> getUmbrella() async {
    try {
      emit(LoadingState());
      umbrellas = await umbrella.getInfo();
      print(umbrellas
          .toString()); //TODO CERCA DI CAPIRE DOVE METTE LA LISTA PER USARLA NELLA VIEW
      emit(LoadedState(umbrellas));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

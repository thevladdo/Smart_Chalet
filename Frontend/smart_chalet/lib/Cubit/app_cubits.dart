// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_chalet/Cubit/app_cubit_states.dart';
import 'package:smart_chalet/Services/umbrella_service.dart';

class AppCubits extends Cubit<CubitStates> {
  // When the initialization of the page (InitialState) will be done, then...
  AppCubits({required this.umbrella}) : super(InitialState()) {
    // ..trigger this state
    emit(WelcomeState());
  }

  final UmbrellaService umbrella;
  //Oggetto Umbrella che attendo dalla chiamata di getData

  dynamic loaded; //dynamic che può assumere qualsiasi tipo in base al contesto

  Future<void> getUmbrella() async {
    try {
      loaded = null;
      emit(LoadingState());
      loaded = await umbrella.getInfo();
      if (kDebugMode) {
        print(loaded.toString());
      }
      emit(LoadedState(loaded));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void register() {
    emit(RegState());
  }

  void login() {
    emit(LoginState());
  }

  void jumpNavigator() {
    emit(NavState());
  }

  void jumpHome() {
    emit(HomeState());
  }
}

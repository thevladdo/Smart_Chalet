import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_chalet/Cubit/app_cubit_states.dart';
import 'package:smart_chalet/Services/register_service.dart';
import 'package:smart_chalet/Services/umbrella_service.dart';

import '../Model/auth_credential.dart';

class AppCubits extends Cubit<CubitStates> {
  // When the initialization of the page (InitialState) will be done, then...
  AppCubits({required this.umbrella, required this.registerService})
      : super(InitialState()) {
    // ..trigger this state
    emit(WelcomeState());
  }

  final RegisterService registerService;
  final UmbrellaService umbrella;
  //Oggetto Umbrella che attendo dalla chiamata di getData

  dynamic loaded; //dynamic che può assumere qualsiasi tipo in base al contesto
  dynamic user;

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

  Future<void> getUserReg(String name, String surname, String mail,
      String password, Role role) async {
    try {
      user = null;
      emit(LoadingState());
      user =
          await registerService.register(name, surname, mail, password, role);
      List<dynamic> users = [];
      users.add(user);
      emit(LoadedState(users));
    } catch (e) {
      //TODO Error state
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

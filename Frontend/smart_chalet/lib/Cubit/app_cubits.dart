import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_chalet/Cubit/app_cubit_states.dart';
import 'package:smart_chalet/Services/reservation_service.dart';
import 'package:smart_chalet/Services/login_service.dart';
import 'package:smart_chalet/Services/register_service.dart';
import 'package:smart_chalet/Services/umbrella_service.dart';

import '../Model/auth_credential.dart';

class AppCubits extends Cubit<CubitStates> {
  // When the initialization of the page (InitialState) will be done, then...
  AppCubits({
    required this.reservationService,
    required this.umbrella,
    required this.registerService,
    required this.loginService,
  }) : super(InitialState()) {
    // ..trigger this state
    emit(WelcomeState());
  }

  final RegisterService registerService;
  final LoginService loginService;
  final UmbrellaService umbrella;
  final ReservationService reservationService;
  //Oggetto Umbrella che attendo dalla chiamata di getData

  dynamic loaded; //dynamic che può assumere qualsiasi tipo in base al contesto
  dynamic user;
  dynamic res;

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

  Future<void> getReservation() async {
    try {
      res = null;
      emit(LoadingState());
      res = await reservationService.getReservationInfo();
      if (kDebugMode) {
        print(res.toString());
      }
      emit(LoadedResState(res));
    } catch (e) {
      emit(ResNoFoundState());
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
      LoadedUserState(users).setName();
      emit(LoadedUserState(users));
    } catch (e) {
      emit(RegErrorState());
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getUserLogin(String mail, String password, Role role) async {
    try {
      user = null;
      emit(LoadingState());
      user = await LoginService().login(mail, password, role);
      List<dynamic> users = [];
      users.add(user);
      LoadedUserState(users).setName();
      emit(LoadedUserState(users));
    } catch (e) {
      emit(LoginErrorState());
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void register() {
    emit(RegState());
  }

  void logOut() {
    emit(WelcomeState());
  }

  void backToWelcome() {
    emit(WelcomeState());
  }

  void aboutUs() {
    emit(AboutUsState());
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

  void reservePage(
      String selectedDate, String dateCount, String range, String rangeCount) {
    emit(ReserveNowState(selectedDate, dateCount, range, rangeCount));
  }
}

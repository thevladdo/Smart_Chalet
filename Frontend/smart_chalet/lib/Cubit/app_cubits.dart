import 'package:bloc/bloc.dart';
import 'package:smart_chalet/Cubit/app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  // When the initialization of the page (InitialState) will be done, then...
  AppCubits() : super(InitialState()) {
    // ..trigger this state
    emit(WelcomeState());
  }
}

import 'package:equatable/equatable.dart';
import 'package:smart_chalet/Model/umbrella.dart';

//States should have data
abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  //if I change something in the app, like a variable x,
  //this state will rebuild this part of the app
  @override
  List<Object> get props => [
        //here is the variable that can change
      ];
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

//Triggered whend app is loading, showing an cicular animation
class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

//Triggered whend app is loaded
class LoadedState extends CubitStates {
  LoadedState(this.umbrellas);

  final List<Umbrella> umbrellas;

  @override
  List<Object> get props => [umbrellas];
}

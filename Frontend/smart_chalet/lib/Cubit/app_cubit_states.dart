import 'package:equatable/equatable.dart';

///States should have data

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  //if I change something in the app, like a variable x,
  //this state will rebuild this part of the app

  @override
  // TODO: implement props
  List<Object> get props => [
        //here is the variable that can change
      ];
}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

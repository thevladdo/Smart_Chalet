import 'package:equatable/equatable.dart';
import 'package:smart_chalet/Model/app_user.dart';

import '../Utilities/account_details.dart';

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
  LoadedState(this.loaded);

  final List<dynamic> loaded;

  @override
  List<Object> get props => [loaded];
  //The prop can be directly accessed from BlocBuilder
}

class LoadedResState extends CubitStates {
  LoadedResState(this.res);

  final dynamic res;

  @override
  List<Object> get props => [res];
  //The prop can be directly accessed from BlocBuilder
}

class LoadedUserState extends CubitStates {
  LoadedUserState(this.loadedUser);

  final List<dynamic> loadedUser;

  setName() {
    AppUser appUser = loadedUser[0];
    String name = appUser.getName;
    String mail = appUser.getMail;
    GlobUser().setName(name);
    GlobUser().setMail(mail);
  }

  @override
  List<Object> get props => [loadedUser];
  //The prop can be directly accessed from BlocBuilder
}

class RegState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoginState extends CubitStates {
  @override
  List<Object> get props => [];
}

class NavState extends CubitStates {
  @override
  List<Object> get props => [];
}

class HomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

class RegErrorState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoginErrorState extends CubitStates {
  @override
  List<Object> get props => [];
}

class ResNoFoundState extends CubitStates {
  @override
  List<Object> get props => [];
}

class AboutUsState extends CubitStates {
  @override
  List<Object> get props => [];
}

class ReserveNowState extends CubitStates {
  ReserveNowState(
    this.selectedDate,
    this.dateCount,
    this.range,
    this.rangeCount,
  );

  final String selectedDate;
  final String dateCount;
  final String range;
  final String rangeCount;

  @override
  List<Object> get props => [selectedDate, dateCount, range, rangeCount];
}

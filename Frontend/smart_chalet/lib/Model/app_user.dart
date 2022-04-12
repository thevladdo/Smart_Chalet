import 'auth_credential.dart';

class AppUser {
  String name;
  String surname;
  String mail;
  Role role;

  set setRole(role) => this.role = role;

  AppUser({
    required this.name,
    required this.surname,
    required this.mail,
    required this.role,
  });

  String get getName => name;

  set setName(String name) => this.name = name;

  get getSurname => surname;

  set setSurname(surname) => this.surname = surname;

  get getMail => mail;

  set setMail(mail) => this.mail = mail;

  get getRole => role;

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
        name: json['name'],
        surname: json['surname'],
        mail: json['mail'],
        role: json['role']);
  }
}

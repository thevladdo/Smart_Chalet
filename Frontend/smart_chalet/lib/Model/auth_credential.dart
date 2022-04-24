// ignore_for_file: constant_identifier_names

class AuthCredential {
  String mail;
  String password;
  List<Role> _roles = [];

  AuthCredential({
    required this.mail,
    required this.password,
  });

  AuthCredential.complete(
    this.mail,
    this.password,
    this._roles,
  );

  factory AuthCredential.fromJson(Map<String, dynamic> json) {
    return AuthCredential(mail: json["mail"], password: json["password"]);
  }

  String get getMail => mail;

  set setMail(String mail) => this.mail = mail;

  get getPassword => password;

  set setPassword(password) => this.password = password;

  get getRoles => _roles;

  set setRoles(value) => _roles = value;

  List<String> getRolesToString() {
    List<String> roles = [];
    for (Role item in _roles) {
      roles.add(item.toString().substring(item.toString().indexOf('.') + 1));
    }
    return roles;
  }
}

enum Role {
  CLIENT,
  BARSTAFF,
  ENTERTAINER,
  MANAGER,
  RECEPTIONSTAFF,
}

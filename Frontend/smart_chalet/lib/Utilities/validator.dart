String? validateEmail(
  String? value,
) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter a valid Email';
  } else {
    return null;
  }
}

String? validatePsw(String? value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (value == null) {
    return 'Enter a valid Password';
  }
  if (value.length < 6) {
    return 'Minimun 6 Characters';
  }
  if (value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter a valid Password';
  } else {
    return null;
  }
}

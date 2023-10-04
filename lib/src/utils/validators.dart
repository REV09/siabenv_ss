bool curpValidator(String curp) {
  RegExp textValidator =
      RegExp("([A-Za-z]{4})([0-9]{6})([A-Za-z]{6,7})([0-9]{1,2})");
  return textValidator.hasMatch(curp);
}

bool validatePassword(String password) {
  String regExp = "(?=.*?[!@#\$&*~;:])";
  RegExp textValidator = RegExp(regExp);
  return textValidator.hasMatch(password);
} //if it's false the password is valid, else it returns true

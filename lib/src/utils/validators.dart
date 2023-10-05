bool curpValidator(String curp) {
  RegExp textValidator = RegExp("[A-Z0-9]");
  return textValidator.hasMatch(curp);
}

bool validatePassword(String password) {
  String regExp = "(?=.*?[!@#\$&*~;:])";
  RegExp textValidator = RegExp(regExp);
  return textValidator.hasMatch(password);
} //if it's false the password is valid, else it returns true

class AppRegex {
  static RegExp emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');


  static RegExp passwordValid = RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");


  static RegExp lowerCase = RegExp(r'^(?=.*[a-z])');


  static RegExp upperCase = RegExp(r'^(?=.*[A-Z])');


  static RegExp number = RegExp(r'^(?=.*?[0-9])');

  static RegExp specialCharacter = RegExp(r'^(?=.*?[#?!@$%^&*-])');


  static RegExp minLength = RegExp(r'^(?=.{8,})');

}
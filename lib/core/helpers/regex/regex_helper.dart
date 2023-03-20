const String _emailRegExp =  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const String _speacialCharacterRexExp = r'^[a-zA-Z0-9]+$';

class RegexHelper {
  RegexHelper._();
  static final shared = RegexHelper._();

  bool isCorrectEmail({required String email}) {
    RegExp regExp = RegExp(_emailRegExp);
    return regExp.hasMatch(email);
  }

  bool hasSpecialCharacter({required String email}) {
    RegExp regExp = RegExp(_speacialCharacterRexExp);
    return regExp.hasMatch(email);
  }
}

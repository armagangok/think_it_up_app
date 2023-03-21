const String _emailRegExp =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const String _speacialCharacterRexExp = r'^[a-zA-Z0-9]+$';

//
//
// Here is an explanation:
// r'^
//   (?=.*[A-Z])       // should contain at least one upper case
//   (?=.*[a-z])       // should contain at least one lower case
//   (?=.*?[0-9])      // should contain at least one digit
//   (?=.*?[!@#\$&*~]) // should contain at least one Special character
//   .{8,}             // Must be at least 8 characters in length
// $'
const String _powerfullPasswordRexExp =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

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

  bool isPowerfulPassword({required String email}) {
    RegExp regExp = RegExp(_powerfullPasswordRexExp);
    return regExp.hasMatch(email);
  }
}

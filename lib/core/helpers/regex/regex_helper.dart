class RegexHelper {
  RegexHelper._();
  static final shared = RegexHelper._();

  bool isCorrectEmail({required String email}) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);
    return regExp.hasMatch(email);
  }

  bool hasSpecialCharacter({required String email}) {
    
    String p = r'^[a-zA-Z0-9]+$';

    RegExp regExp = RegExp(p);
    return regExp.hasMatch(email);
  }
}

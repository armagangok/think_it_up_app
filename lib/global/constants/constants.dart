class CustomColor {
  static final CustomColor _singleton = CustomColor._internal();

  factory CustomColor() {
    return _singleton;
  }

  CustomColor._internal();
}

class ConstText {
  static final ConstText _singleton = ConstText._internal();

  factory ConstText() {
    return _singleton;
  }

  ConstText._internal();

  String error =
      "Invalid password or email. \n There may be an account with that email.";

  String verification = """\nHello There!\n
    Verification link has been sent your e-mail.\n
    Do you really think that you can signin without verification? \n""";
}

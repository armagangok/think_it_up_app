class CustomColor {
  static final CustomColor _singleton = CustomColor._internal();

  factory CustomColor() {
    return _singleton;
  }

  CustomColor._internal();

  
}

import 'dart:io';

AdHelper adHelper = AdHelper();

final AdHelper admobHelper = AdHelper();

class AdHelper {
  String get bannerAdUnitId1 {
    if (Platform.isAndroid) {
      return "dummy";
    } else if (Platform.isIOS) {
      return "dummy";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  String get bannerAdUnitId2 {
    if (Platform.isAndroid) {
      return "dummy";
    } else if (Platform.isIOS) {
      return "dummy";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  String get bannerAdUnitId3 {
    if (Platform.isAndroid) {
      return "dummy";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/2934735716";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  String get bannerAdUnitId4 {
    if (Platform.isAndroid) {
      return "dummy";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/2934735716";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}

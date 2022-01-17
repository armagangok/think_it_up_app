import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';

class SwitchProvider extends ChangeNotifier {
  bool switchVal = true;
  
  changeSwicth(bool val) {
    notifyListeners();
  }
}

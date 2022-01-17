import 'package:think_it_up_app/app/views/dashboard/components/export/export.dart';
import 'package:think_it_up_app/background/local/base/switch_base.dart';

class ThemeProvider extends ChangeNotifier implements BaseViewModel {
  @override
  bool switchVal = true;

  @override
  void changeSwicth() {
    switchVal = !switchVal;
    notifyListeners();
  }
}

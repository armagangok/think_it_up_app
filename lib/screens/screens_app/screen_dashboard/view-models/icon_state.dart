import 'package:think_it_up_app/global/local/base/icon_state_base.dart';

class IconState  implements IconStateBase {
  @override
  bool isLiked = false;

  @override
  void like() {
    isLiked = !isLiked;
    
  }

}

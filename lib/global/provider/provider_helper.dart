import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../screens/screens_app/screen_dashboard/networking/services/question_service.dart';
import '../../screens/screens_app/screen_dashboard/viewmodels/dashboard_viewmodel.dart';
import '../../screens/screens_app/screen_dashboard/viewmodels/icon_state.dart';
import '../local/viewmodels/notification_provider.dart';
import '../local/viewmodels/theme_provider.dart';
import '../network/firebase/auth/viewmodels/user_viewmodel.dart';
import '../network/firestore/viewmodels/db_viewmodel.dart';

class ProviderHelper {
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => NotificationProvider()),
    ChangeNotifierProvider(create: (_) => UserViewModel()),
    ChangeNotifierProvider(create: (_) => IconState()),
    ChangeNotifierProvider(create: (_) => DashVievModel()),
    Provider(create: (_) => DbViewModel()),
    Provider(create: (_) => QuestionService()),
  ];
}

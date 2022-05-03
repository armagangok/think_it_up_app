import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../screens/screens_app/screen_dashboard/networking/services/question_service.dart';
import '../../screens/screens_app/screen_dashboard/networking/viewmodels/dashboard_viewmodel.dart';
import '../../screens/screens_app/screen_dashboard/networking/viewmodels/firebase_viewmodel.dart';
import '../local/viewmodels/notification_provider.dart';
import '../local/viewmodels/theme_provider.dart';
import '../network/firebase/auth/viewmodels/user_viewmodel.dart';

class ProviderHelper {
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => NotificationProvider()),
    ChangeNotifierProvider(create: (_) => FirebaseModel()), 
    ChangeNotifierProvider(create: (_) => DashVievmodel()),
    ChangeNotifierProvider(create: (_) => FirebaseViewmodel()),
    Provider(create: (_) => QuestionService()),
  ];
}

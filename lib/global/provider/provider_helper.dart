import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../core/networking/firebase/view-models/firebase_viewmodel.dart';
import '../../screens/screens_app/screen_dashboard/networking/services/question_service.dart';
import '../../screens/screens_app/screen_dashboard/networking/view-models/dashboard_viewmodel.dart';
import '../../screens/screens_app/screen_dashboard/networking/view-models/firestore_viewmodel.dart';
import '../../screens/screens_app/screen_dashboard/view-models/icon_state.dart';
import '../local/viewmodels/notification_provider.dart';
import '../local/viewmodels/theme_provider.dart';

class ProviderHelper {
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => NotificationProvider()),
    ChangeNotifierProvider(create: (_) => FirebaseViewmodel()),
    ChangeNotifierProvider(create: (_) => DashVievmodel()),
    ChangeNotifierProvider(create: (_) => FirestoreViewmodel()),
    Provider(create: (_) => IconState()),
    Provider(create: (_) => QuestionService()),
  ];
}

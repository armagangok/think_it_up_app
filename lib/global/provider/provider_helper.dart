import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:think_it_up_app/global/network/firebase/auth/viewmodels/user_viewmodel.dart';
import 'package:think_it_up_app/global/network/firebase/firestore/viewmodels/db_viewmodel.dart';
import 'package:think_it_up_app/screens/screens_app/screen_dashboard/services/question_service.dart';
import '../local/viewmodels/notification_provider.dart';
import '../local/viewmodels/theme_provider.dart';

class ProviderHelper {
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => NotificationProvider()),
    ChangeNotifierProvider(create: (_) => UserViewModel()),
    ChangeNotifierProvider(create: (_) => DbViewModel()),
    Provider(create: (_) => QuestionService()),
  ];
}

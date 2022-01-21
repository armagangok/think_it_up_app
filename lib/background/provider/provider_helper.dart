import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:think_it_up_app/background/network/firebase/auth/viewmodels/user_viewmodel.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/models/post_model.dart';
import 'package:think_it_up_app/background/network/firebase/firestore/viewmodels/db_viewmodel.dart';
import '../local/viewmodels/notification_provider.dart';
import '../local/viewmodels/theme_provider.dart';

class ProviderHelper {
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => NotificationProvider()),
    ChangeNotifierProvider(create: (_) => UserViewModel()),
    FutureProvider<List<PostModel>>(
      create: (_) => DbViewModel().getPosts(),
      initialData: const [],
    ),
  ];
}

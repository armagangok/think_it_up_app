import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/export/core_export.dart';
import 'core/helpers/screen_util_helper/screen_util.dart';
import 'core/initilization/initapp.dart';

void main() async => await initApp();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilHelper.screenUtilInit(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomTheme().darkTheme,
          home: const LoginPage(),
          initialRoute: KRoute.rootPage,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          navigatorKey: NavigationService.instance.navigatorKey,
        ),
      ),
    );
  }
}

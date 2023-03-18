import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login/login.dart';
import '../../features/auth/presentation/pages/register/register.dart';
import '../../features/dashboard/presentation/pages/dashboard.dart';
import '../../features/settings/presentation/pages/editting_user_profile.dart';
import '../../features/settings/presentation/pages/setting.dart';
import '../../features/share/presentation/pages/post_share.dart';
import '../../features/winners/presentation/pages/winners.dart';
import '/features/home/presentation/pages/home.dart';
import 'constant/routes.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case KRoute.onboardingPage:
        return _getRoute(const Text(""));

      case KRoute.homePage:
        return _getRoute(const HomePage());

      case KRoute.settingPage:
        return _getRoute(const SettingPage());

      case KRoute.edittingUserPage:
        return _getRoute(const EdittingUserProfilePage());

      case KRoute.loginPage:
        return _getRoute(const LoginPage());

      case KRoute.registerPage:
        return _getRoute(const RegisterPage());

      case KRoute.winnersPage:
        return _getRoute(const WinnerPage());

      case KRoute.postSharePage:
        return _getRoute(const SharePostPage());

      case KRoute.dashboardPage:
        return _getRoute(const DashBoardPage());

      // case KRoute.HOROSCOPE_DETAIL_PAGE:
      //   return _getRoute(HoroscopeDetailPage(horoscopeModel: horoscopeModel));

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: textWidget,
          ),
        );
    }
  }

  Widget get textWidget => const Text("Not Found.");

  PageRoute _getRoute(Widget page) => MaterialPageRoute(
        builder: (context) => page,
      );
}

import 'package:get/get.dart';

import '../ui/home/home_screen.dart';
import '../ui/login/login_screen.dart';

class Routes {
  static const String login = "/login";
  static const String home = "/home";

  static List<GetPage> pages = [
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}

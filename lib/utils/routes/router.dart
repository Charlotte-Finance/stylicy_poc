import 'package:flutter/material.dart';

import '../../pages/count_page.dart';
import '../../pages/login/login_page.dart';
import '../../pages/login/splash_page.dart';
import '../../pages/product_page.dart';
import 'constants.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case countRoute:
        return MaterialPageRoute(builder: (_) => const CountPage());
      case productRoute:
        return MaterialPageRoute(builder: (_) => const ProductPage());
      default:
        return MaterialPageRoute(builder: (_) => const SplashPage());
    }
  }
}

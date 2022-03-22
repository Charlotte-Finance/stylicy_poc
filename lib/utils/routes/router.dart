import 'package:flutter/material.dart';
import 'package:poc/pages/counter/count_page.dart';
import 'package:poc/pages/login/login_page.dart';
import 'package:poc/pages/login/splash_page.dart';
import 'package:poc/pages/product/product_page.dart';

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

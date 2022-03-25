import 'package:flutter/material.dart';
import 'package:poc/pages/counter/count_page.dart';
import 'package:poc/pages/login_page.dart';
import 'package:poc/pages/splash_page.dart';
import 'package:poc/pages/product/product_page.dart';

import '../../pages/home_page.dart';
import 'constants.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case productRoute:
        return MaterialPageRoute(builder: (_) => const ProductPage());
      default:
        return MaterialPageRoute(builder: (_) => const SplashPage());
    }
  }
}

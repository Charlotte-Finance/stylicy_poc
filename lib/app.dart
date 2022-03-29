import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:poc/blocs/login/login_bloc/login_bloc.dart';
import 'package:poc/pages/home_page.dart';
import 'package:poc/pages/login_page.dart';
import 'package:poc/pages/splash_page.dart';
import 'package:poc/repositories/login/authentication_repository.dart';
import 'package:poc/styles/theme.dart';

import 'blocs/login/authentication_bloc/authentication_bloc.dart';
import 'blocs/login/register_bloc/register_bloc.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyBehavior(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('fr', ''), // French, no country code
        Locale('de', ''), // German, no country code
        Locale('th', ''), // Thai, no country code
      ],
      theme: myTheme,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.skipped:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.facebook:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                      (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                context.read<LoginBloc>().add(const LoginReset());
                context.read<RegisterBloc>().add(const RegisterReset());
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}

/*
class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyBehavior(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('fr', ''), // French, no country code
        Locale('de', ''), // German, no country code
        Locale('th', ''), // Thai, no country code
      ],
      theme: myTheme,
      onGenerateRoute:  (_) => SplashPage.route(),
      home: Builder(
        builder: (context) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthenticationStatus.authenticated:
                    print("here");
                    Navigator.pushNamed(
                      context,
                      homeRoute,
                    );
                    break;
                  case AuthenticationStatus.skipped:
                    print("here");
                    Navigator.pushNamed(
                      context,
                      homeRoute,
                    );
                    break;
                  case AuthenticationStatus.unauthenticated:
                    print("la");
                    Navigator.pushNamed(context, loginRoute);
                    break;
                  default:
                    print("there");

                    Navigator.pushNamed(context,splashRoute);
                }
              },
              child: const SplashPage());
          //child: const SplashPage());
        },
      ),
    );
  }
}
*/

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

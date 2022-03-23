import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:poc/pages/login/login_page.dart';
import 'package:poc/pages/login/splash_page.dart';
import 'package:poc/styles/theme.dart';
import 'package:poc/utils/routes/constants.dart';
import 'package:poc/utils/routes/router.dart';

import 'blocs/login/authentication_bloc/authentication_bloc.dart';


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
      onGenerateRoute: MyRouter.generateRoute,
      initialRoute: splashRoute,
      home: Builder(
        builder: (context) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                // switch (state.status) {
                //   case AuthenticationStatus.authenticated:
                //     Navigator.pushNamed(
                //       context,
                //       countRoute,
                //     );
                //     break;
                //   case AuthenticationStatus.unauthenticated:
                //     Navigator.pushNamed(context, loginRoute);
                //     break;
                //   default:
                //     break;
                // }
              },
              child: const LoginPage());
          //child: const SplashPage());
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
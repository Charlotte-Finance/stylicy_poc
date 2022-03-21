import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/pages/login/login_page.dart';
import 'package:poc/utils/routes/constants.dart';
import 'package:poc/utils/routes/router.dart';
import 'package:poc/utils/styles/theme.dart';

import 'blocs/login/authentication_bloc/authentication_bloc.dart';


class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poc/components/login/reset_password/reset_password_confirmation.dart';
import 'package:poc/components/login/reset_password/reset_password_form.dart';
import 'package:poc/models/login/forms/formz.dart';

import '../../blocs/login/login_bloc/login_bloc.dart';
import '../../blocs/login/reset_password_bloc/forgot_password_bloc.dart';
import '../app/text_divider.dart';

part 'login_tab/login_buttons.dart';

part 'login_tab/login_form.dart';

part 'login_tab/login_platforms.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.1,
          right: size.width * 0.1,
        ),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            SizedBox(
              height: size.height * 0.32,
              child: const _LoginForm(),
            ),
            SizedBox(
              width: size.width * 0.5,
              child: const _LoginButtons(),
            ),
            const Expanded(child: SizedBox.shrink()),
            const _LoginPlatforms()
          ],
        ),
      ),
    );
  }
}

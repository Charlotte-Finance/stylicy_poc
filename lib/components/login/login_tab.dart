import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poc/components/login/reset_password/reset_password_pop_up.dart';

import '../../styles/theme.dart';
import '../app/text_divider.dart';


part 'login_tab/login_buttons.dart';

part 'login_tab/login_form.dart';

part 'login_tab/login_platforms.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.1,
        right: size.width * 0.1,
      ),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.045),
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
    );
  }
}

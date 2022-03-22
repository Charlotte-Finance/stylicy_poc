import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../styles/theme.dart';
import '../../utils/constants/colors.dart';
import '../app/text_divider.dart';

part 'login_tab/forgot_pwd_popup.dart';
part 'login_tab/login_buttons.dart';
part 'login_tab/login_form.dart';
part 'login_tab/login_platforms.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox.shrink(),
        const _LoginForm(),
        SizedBox(
            width: size.width * 0.5,
            child: const _LoginButtons()),
        const _LoginPlatforms(),
      ],
    );
  }
}

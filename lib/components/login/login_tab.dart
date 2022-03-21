import 'package:flutter/material.dart';
import 'package:poc/components/widgets/text_divider.dart';
import 'package:poc/utils/constants/colors.dart';
import 'package:poc/utils/constants/strings/login_strings.dart';
import 'package:poc/utils/styles/theme.dart';
part 'login_tab/login_buttons.dart';
part 'login_tab/login_form.dart';
part 'login_tab/login_platforms.dart';
part 'login_tab/forgot_pwd_popup.dart';

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
